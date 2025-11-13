import 'package:workiom/core/network/api_service.dart';
import 'package:workiom/core/network/constants_api.dart';
import 'package:workiom/core/network/error_handler.dart';
import 'package:workiom/core/network/failure.dart';
import 'package:workiom/core/util/state_render/result.dart';
import 'package:workiom/features/auth/models/editions_for_select_model.dart';
import 'package:workiom/features/auth/models/get_password_complexity_setting_model.dart';
import 'package:workiom/features/auth/models/password_complexity_model.dart';
import 'package:workiom/features/auth/models/tenant_available_model.dart';
import 'package:workiom/features/auth/models/user_model.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({
    required this.apiService,
  });

  Future<Result<Failure, EditionsForSelectModel?>> getEditionsForSelect() async {
    try {
      final response = await apiService.get<EditionsForSelectModel>(
        url: ConstantsApi.getEditionsForSelectUrl,
        fromJsonT: EditionsForSelectModel.fromJson,
      );
      return Right(response.result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  Future<Result<Failure, PasswordComplexityModel?>> getPasswordComplexitySetting() async {
    try {
      final response = await apiService.get<GetPasswordComplexitySettingModel>(
        url: ConstantsApi.getPasswordComplexitySettingUrl,
        fromJsonT: GetPasswordComplexitySettingModel.fromJson,
      );
      return Right(response.result?.setting);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  Future<Result<Failure, bool>> isTenantAvailable({
    required String name,
  }) async {
    try {
      final response = await apiService.post<TenantAvailableModel>(
        url: ConstantsApi.tenantAvailableUrl,
        data: {
          'tenancyName': name,
        },
        fromJsonT: TenantAvailableModel.fromJson,
      );
      return Right(response.result?.tenantId == null);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  Future<Result<Failure, UserModel?>> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String name,
    required int editionId,
  }) async {
    try {
      final response = await apiService.post<UserModel>(
        url: ConstantsApi.registerTenantUrl,
        data: {
          'adminEmailAddress': email,
          'adminFirstName': firstName,
          'adminLastName': lastName,
          'adminPassword': password,
          'captchaResponse': null,
          "editionId": editionId,
          'name': name,
          'tenancyName': name,
        },
        fromJsonT: UserModel.fromJson,
      );
      return Right(response.result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
