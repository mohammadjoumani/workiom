import 'package:workiom/core/network/api_service.dart';
import 'package:workiom/core/network/constants_api.dart';
import 'package:workiom/core/network/error_handler.dart';
import 'package:workiom/core/network/failure.dart';
import 'package:workiom/core/util/state_render/result.dart';
import 'package:workiom/features/generic/models/current_login_model.dart';

class GenericRepository {
  final ApiService apiService;

  GenericRepository({
    required this.apiService,
  });

  Future<Result<Failure, CurrentLoginModel?>> getCurrentLogin() async {
    try {
      final response = await apiService.get<CurrentLoginModel>(
        url: ConstantsApi.getCurrentLoginInfoUrl,
        fromJsonT: CurrentLoginModel.fromJson,
      );
      return Right(response.result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
