import 'package:e_commerce_task/core/constants/consts.dart';
import 'package:e_commerce_task/core/routing/app_router.dart';
import 'package:e_commerce_task/core/routing/routes.dart';
import 'package:e_commerce_task/core/utils/cache_helper.dart';
import 'package:e_commerce_task/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await CacheHelper.casheIntialization();
  await ScreenUtil.ensureScreenSize();
  final token = await CacheHelper.getSecuredData(key: kAccessToken);

  runApp(EcommerceApp(token: token));
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key, required this.token});
  final String? token;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        initialRoute: token == null ? Routes.login : Routes.bottomBar,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
