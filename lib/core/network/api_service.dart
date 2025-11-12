import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/core/routes/app_routes.dart';
import 'package:workiom/core/services/network_info.dart';
import 'package:workiom/core/util/app_context.dart';
import 'package:workiom/core/util/data_models/network_response_model.dart';

import 'constants_api.dart';
import 'error_handler.dart';
import 'logger_interceptor.dart';

enum MethodEnum {
  get('GET'),
  post('POST'),
  put('PUT'),
  patch('PATCH'),
  delete('DELETE');

  final String name;

  const MethodEnum(this.name);
}
//
// Map<String, String> contentType = {
//   'content-type': 'application/json',
// };
//
// Map<String, String> contentTypeForm = {
//   'content-type': 'application/x-www-form-urlencoded',
// };

const String applicationFormJson = 'application/x-www-form-urlencoded';
const String applicationJson = "application/json";
const int apiTimeOut = 60000;

bool isChecked = false;
bool isSkip = false;

class ApiService {
  final Dio dio = Dio();
  // final SettingLocalData settingLocalData;
  final NetworkInfo networkInfo;

  ApiService({
    required this.networkInfo,
  }) {
    Map<String, String> headers = {
      'content-type': applicationJson,
      'accept': applicationJson,
    };

    dio.options = BaseOptions(
      baseUrl: ConstantsApi.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: apiTimeOut),
      sendTimeout: const Duration(milliseconds: apiTimeOut),
      connectTimeout: const Duration(milliseconds: apiTimeOut),
    );
    if (!kReleaseMode) {
      dio.interceptors.add(
        LoggerInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          error: true,
        ),
      );
    }
  }

  Future<dynamic> customRequest(
    MethodEnum method, {
    required String url,
    dynamic data,
    dynamic params,
    Map<String, String>? header,
  }) async {
    final response = await dio.request(
      url,
      data: data,
      queryParameters: params,
      options: Options(
        method: method.name,
        headers: header,
      ),
    );
    return response.data;
  }

  Future<NetworkResponseModel<T>> _request<T>(
    MethodEnum method, {
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? fromJsonT,
    T Function(List<dynamic>)? fromJsonTList,
  }) async {
    // Network check
    final isConnected = await networkInfo.isConnected;

    if (!isConnected) {
      throw _buildDioException(
        ResponseCode.noInternetConnection,
        ResponseMessage.noInternetConnection,
      );
    }

    // Prepare headers and send request
    // final requestHeaders = _buildHeaders(url, headers);
    final response = await dio.request(
      url,
      data: data,
      queryParameters: params,
      options: Options(
        method: method.name,
        // headers: requestHeaders,
      ),
    );

    // // Handle invalid token or string response
    // if (response.statusCode == 200 && response.data is String) {
    //   _logout();
    //   throw _buildDioException(
    //     ResponseCode.unauthorised,
    //     ResponseMessage.unauthorised,
    //     requestOptions: response.requestOptions,
    //   );
    // }

    // Save cookies
    // _handleCookie(url, response);

    // Map to model
    return NetworkResponseModel<T>.fromJson(
      json: response.data,
      fromJsonT: fromJsonT,
      fromJsonTList: fromJsonTList,
    );
  }

  // Map<String, dynamic> _buildHeaders(String url, Map<String, dynamic>? headers) {
  //   final resultHeaders = <String, dynamic>{
  //     'X-lang': settingLocalData.getLanguageApp(),
  //     'X-Db-Name': Constants.dbName,
  //   };
  //
  //   if (url != ConstantsApi.loginUrl) {
  //     resultHeaders[HttpHeaders.cookieHeader] = settingLocalData.getCookie();
  //   }
  //
  //   if (headers != null) {
  //     resultHeaders.addAll(headers);
  //   }
  //
  //   return resultHeaders;
  // }

  // void _handleCookie(String url, Response response) {
  //   if (url == ConstantsApi.loginUrl) {
  //     // final cookie = response.headers[HttpHeaders.setCookieHeader]?.first ?? '';
  //     // settingLocalData.setCookie(cookie);
  //   }
  // }

  void _logout() {
    // settingLocalData.clearBox();
    GoRouter.of(AppContext.context).goNamed(AppRoutes.splashRoute);
  }

  DioException _buildDioException(
    int statusCode,
    String statusMessage, {
    RequestOptions? requestOptions,
  }) {
    final options = requestOptions ?? RequestOptions();
    return DioException(
      requestOptions: options,
      type: DioExceptionType.badResponse,
      response: Response(
        requestOptions: options,
        statusCode: statusCode,
        statusMessage: statusMessage,
      ),
      error: statusMessage,
    );
  }

  Future<NetworkResponseModel<T>> get<T>({
    required String url,
    dynamic data,
    dynamic params,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? fromJsonT,
    T Function(List<dynamic>)? fromJsonTList,
  }) =>
      _request(
        MethodEnum.get,
        url: url,
        data: data,
        params: params,
        headers: headers,
        fromJsonT: fromJsonT,
        fromJsonTList: fromJsonTList,
      );

  Future<NetworkResponseModel<T>> post<T>({
    required String url,
    dynamic data,
    dynamic params,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? fromJsonT,
    T Function(List<dynamic>)? fromJsonTList,
  }) =>
      _request(
        MethodEnum.post,
        url: url,
        data: data,
        params: params,
        headers: headers,
        fromJsonT: fromJsonT,
        fromJsonTList: fromJsonTList,
      );

  Future<NetworkResponseModel<T>> put<T>({
    required String url,
    dynamic data,
    dynamic params,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? fromJsonT,
    T Function(List<dynamic>)? fromJsonTList,
  }) =>
      _request(
        MethodEnum.put,
        url: url,
        data: data,
        params: params,
        headers: headers,
        fromJsonT: fromJsonT,
        fromJsonTList: fromJsonTList,
      );

  Future<NetworkResponseModel<T>> patch<T>({
    required String url,
    dynamic data,
    dynamic params,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? fromJsonT,
    T Function(List<dynamic>)? fromJsonTList,
  }) =>
      _request(
        MethodEnum.patch,
        url: url,
        data: data,
        params: params,
        headers: headers,
        fromJsonT: fromJsonT,
        fromJsonTList: fromJsonTList,
      );

  Future<NetworkResponseModel<T>> delete<T>({
    required String url,
    dynamic data,
    dynamic params,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? fromJsonT,
    T Function(List<dynamic>)? fromJsonTList,
  }) =>
      _request(
        MethodEnum.delete,
        url: url,
        data: data,
        params: params,
        headers: headers,
        fromJsonT: fromJsonT,
        fromJsonTList: fromJsonTList,
      );
}
