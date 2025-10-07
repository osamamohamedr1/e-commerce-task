import 'package:dio/dio.dart';
import 'package:e_commerce_task/core/constants/end_points.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'verify_api_service.g.dart';

@RestApi()
abstract class VerifyApiService {
  factory VerifyApiService(Dio dio, {String? baseUrl}) = _VerifyApiService;

  @POST(kVerifyEmailEndPoint)
  Future<void> verifyOtp({
    @Field() required String email,
    @Field() required String otp,
  });

  @POST(kResendOtpEndPoint)
  Future<void> resendOtp({@Field() required String email});
}
