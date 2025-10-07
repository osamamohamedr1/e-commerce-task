import 'package:e_commerce_task/core/constants/consts.dart';
import 'package:e_commerce_task/core/routing/routes.dart';
import 'package:e_commerce_task/core/utils/cache_helper.dart';
import 'package:e_commerce_task/core/utils/extensions.dart';
import 'package:e_commerce_task/core/utils/show_error_dialog.dart';
import 'package:e_commerce_task/core/utils/show_loading_dialog.dart';
import 'package:e_commerce_task/features/authentication/presentation/bloc/login_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is LoginLoading) {
          showLoadingDialog(context, loadingMessage: 'Please wait a moment.');
        } else if (state is LoginFailure) {
          context.pop();
          showErrorDialog(context, errorMessage: state.errorMessage);
        } else if (state is LoginSuccess) {
          context.pop();

          context.pushNamedAndRemoveUntil(
            Routes.bottomBar,
            predicate: (route) => false,
          );

          CacheHelper.saveData(key: kLogin, value: true);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
