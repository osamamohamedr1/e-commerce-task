import 'package:dartz/dartz.dart';
import 'package:e_commerce_task/core/utils/errors.dart';
import 'package:e_commerce_task/features/authentication/data/datasources/auth_api_service.dart';
import 'package:e_commerce_task/features/authentication/data/models/login_response_model.dart';
import 'package:e_commerce_task/features/authentication/data/models/register_body_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseModel>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> register({required RegisterBodyModel body});
}

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService authApiService;

  AuthRepositoryImpl(this.authApiService);
  @override
  Future<Either<Failure, LoginResponseModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var result = await authApiService.login(email: email, password: password);
      return right(result);
    } catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, String>> register({
    required RegisterBodyModel body,
  }) async {
    try {
      await authApiService.register(body);
      return right('Register Successfuly');
    } catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }
}
