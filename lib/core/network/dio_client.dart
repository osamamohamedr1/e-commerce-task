import 'package:dio/dio.dart';
import 'package:e_commerce_task/core/constants/consts.dart';
import 'package:e_commerce_task/core/constants/end_points.dart';
import 'package:e_commerce_task/core/utils/cache_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static Dio create() {
    final token = CacheHelper.getSecuredData(key: kAccessToken);
    final dio = Dio(
      BaseOptions(
        baseUrl: kBaseUrl,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
        sendTimeout: const Duration(minutes: 2),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final currentToken = await CacheHelper.getSecuredData(
            key: kAccessToken,
          );
          if (currentToken != null) {
            options.headers['Authorization'] = 'Bearer $currentToken';
          }
          handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        // filter: (options, args) {
        //   // don't print requests with uris containing '/posts'
        //   if (options.path.contains('/posts')) {
        //     return false;
        //   }
        //   // don't print responses with unit8 list data
        //   return !args.isResponse || !args.hasUint8ListData;
        // },
      ),
    );

    return dio;
  }
}
