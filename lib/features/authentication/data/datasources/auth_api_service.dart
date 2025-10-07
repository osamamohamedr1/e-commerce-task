import 'package:dio/dio.dart';
import 'package:e_commerce_task/core/constants/end_points.dart';
import 'package:e_commerce_task/features/authentication/data/models/login_response_model.dart';
import 'package:e_commerce_task/features/authentication/data/models/register_body_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(kLoginEndPoint)
  Future<LoginResponseModel> login({
    @Field() required String email,
    @Field() required String password,
  });

  @POST(kRegisterEndPoint)
  Future<void> register(@Body() RegisterBodyModel body);
}
