import 'package:e_commerce_task/core/network/dio_client.dart';
import 'package:e_commerce_task/features/authentication/data/datasources/auth_api_service.dart';
import 'package:e_commerce_task/features/authentication/data/datasources/verify_api_service.dart';
import 'package:e_commerce_task/features/authentication/data/repositories/auth_repo.dart';
import 'package:e_commerce_task/features/authentication/data/repositories/verify_mail_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthApiService>(AuthApiService(DioClient.create()));
  getIt.registerSingleton<VerifyApiService>(
    VerifyApiService(DioClient.create()),
  );

  getIt.registerSingleton<AuthRepositoryImpl>(
    AuthRepositoryImpl(getIt<AuthApiService>()),
  );
  getIt.registerSingleton<VerifyMailRepoImpl>(
    VerifyMailRepoImpl(getIt<VerifyApiService>()),
  );
}
