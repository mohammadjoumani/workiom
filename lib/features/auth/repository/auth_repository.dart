import 'package:workiom/core/network/api_service.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({
    required this.apiService,
  });

// Future<Result<Failure, UserModel?>> login({
//   required String userName,
//   required String password,
// }) async {
//   try {
//     final response = await apiService.post<UserModel>(
//       url: ConstantsApi.loginUrl,
//       data: {
//         'login': userName,
//         'password': password,
//       },
//       fromJsonT: UserModel.fromJson,
//     );
//     _saveData(
//       user: response.data,
//     );
//     return Right(response.data);
//   } catch (error) {
//     return Left(ErrorHandler.handle(error).failure);
//   }
// }
}
