import 'package:e_commerce_task/core/routing/routes.dart';
import 'package:e_commerce_task/core/utils/extensions.dart';
import 'package:e_commerce_task/core/utils/show_error_dialog.dart';
import 'package:e_commerce_task/core/utils/show_loading_dialog.dart';
import 'package:e_commerce_task/features/authentication/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key, required this.getEmail});
  final String Function() getEmail;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showLoadingDialog(context, loadingMessage: 'Please wait a moment.');
        } else if (state is RegisterFailure) {
          context.pop();
          showErrorDialog(context, errorMessage: state.errorMessage);
        } else if (state is RegisterSuccess) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Registration Successful'),
                content: const Text(
                  'An OTP has been sent to your email inbox. Please use it to verify your email.',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                      final currentEmail = getEmail();
                      context.pushNamed(
                        Routes.verifyEmail,
                        arguments: currentEmail,
                      );
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
