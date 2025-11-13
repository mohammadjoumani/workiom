import 'error_model.dart';

class NetworkResponseModel<T> {
  final T? result;
  final String? targetUrl;
  final bool? success;
  final ErrorModel? error;
  final bool? unAuthorizedRequest;
  final bool? bAbp;

  NetworkResponseModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.bAbp,
  });

  factory NetworkResponseModel.fromJson({
    required Map<String, dynamic> json,
    T Function(Map<String, dynamic> json)? fromJsonT,
    T Function(List<dynamic> jsonList)? fromJsonTList,
  }) {
    return NetworkResponseModel(
      targetUrl: json['targetUrl'],
      success: json['success'],
      error: json['error'] != null ? ErrorModel.fromJson(json['error']) : null,
      unAuthorizedRequest: json['unAuthorizedRequest'],
      result: _getData(json, fromJsonT, fromJsonTList),
    );
  }

  static dynamic _getData<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json)? fromJsonT,
    T Function(List<dynamic> jsonList)? formJsonList,
  ) {
    final data = json['result'];
    if (data != null) {
      if (fromJsonT != null && data is Map) {
        return fromJsonT(
          json['result'],
        );
      }
      if (formJsonList != null && data is List) {
        return formJsonList(
          json['result'],
        );
      }
    }

    return null;
  }
}
