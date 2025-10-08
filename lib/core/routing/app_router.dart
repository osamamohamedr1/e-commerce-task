import 'package:e_commerce_task/core/routing/routes.dart';
import 'package:e_commerce_task/core/utils/service_locator.dart';
import 'package:e_commerce_task/features/authentication/data/repositories/auth_repo.dart';
import 'package:e_commerce_task/features/authentication/data/repositories/verify_mail_repo.dart';
import 'package:e_commerce_task/features/authentication/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_task/features/authentication/presentation/bloc/otp_cubit/otp_cubit.dart';
import 'package:e_commerce_task/features/authentication/presentation/views/login_view.dart';
import 'package:e_commerce_task/features/authentication/presentation/views/register_view.dart';
import 'package:e_commerce_task/features/authentication/presentation/views/verify_mail_view.dart';
import 'package:e_commerce_task/features/bottom_bar/presentation/views/bottom_nav_bar.dart';
import 'package:e_commerce_task/features/home/presentation/views/home_view.dart';
import 'package:e_commerce_task/features/cart/presentation/views/cart_view.dart';
import 'package:e_commerce_task/features/favorites/presentation/views/favorites_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(getIt<AuthRepositoryImpl>()),
            child: const LoginView(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(getIt<AuthRepositoryImpl>()),
            child: const RegisterView(),
          ),
        );
      case Routes.bottomBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());
      case Routes.verifyEmail:
        final email = settings.arguments as String? ?? 'user@example.com';
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OtpCubit(getIt<VerifyMailRepoImpl>()),
            child: VerifyMailView(email: email),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.cart:
        return MaterialPageRoute(builder: (_) => const CartView());
      case Routes.favorites:
        return MaterialPageRoute(builder: (_) => const FavoritesView());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const Scaffold());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
