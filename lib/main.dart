import 'package:e_commerce_task/core/routing/app_router.dart';
import 'package:e_commerce_task/core/routing/routes.dart';
import 'package:e_commerce_task/core/utils/cache_helper.dart';
import 'package:e_commerce_task/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await CacheHelper.casheIntialization();
  await ScreenUtil.ensureScreenSize();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.bottomBar,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
