import 'package:dartz/dartz.dart';
import 'package:e_commerce_task/core/utils/errors.dart';
import 'package:e_commerce_task/features/authentication/data/datasources/verify_api_service.dart';

abstract class VerifyMailRepo {
  Future<Either<Failure, void>> verifyOtp(String email, String otp);
  Future<Either<Failure, void>> resendOtp(String email);
}

class VerifyMailRepoImpl implements VerifyMailRepo {
  final VerifyApiService apiService;
  VerifyMailRepoImpl(this.apiService);
  @override
  Future<Either<Failure, void>> verifyOtp(String email, String otp) async {
    try {
      await apiService.verifyOtp(email: email, otp: otp);
      return right(null);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> resendOtp(String email) async {
    try {
      await apiService.resendOtp(email: email);
      return right(null);
    } catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }
}
