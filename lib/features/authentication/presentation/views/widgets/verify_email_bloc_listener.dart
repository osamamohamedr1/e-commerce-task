import 'package:e_commerce_task/core/routing/routes.dart';
import 'package:e_commerce_task/core/utils/extensions.dart';
import 'package:e_commerce_task/core/utils/show_error_dialog.dart';
import 'package:e_commerce_task/core/utils/show_loading_dialog.dart';
import 'package:e_commerce_task/core/widgets/show_custom_snack_bar.dart';
import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/features/authentication/presentation/bloc/otp_cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailBlocListener extends StatelessWidget {
  const VerifyEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) async {
        if (state is VerifyMailLoading) {
          showLoadingDialog(context, loadingMessage: 'Verifying OTP...');
        } else if (state is VerifyMailFailure) {
          context.pop();
        } else if (state is VerifyMailSuccess) {
          context.pop();

          showCustomSnackBar(
            context: context,
            message: state.message,
            backgroundColor: ColorsManger.success,
          );

          context.pushNamedAndRemoveUntil(
            Routes.login,
            predicate: (route) => false,
          );
        } else if (state is ResendOtpLoading) {
          showLoadingDialog(
            context,
            loadingMessage: 'Sending verification code...',
          );
        } else if (state is ResendOtpFailure) {
          context.pop();
          showErrorDialog(context, errorMessage: state.error);
        } else if (state is ResendOtpSuccess) {
          context.pop();

          showCustomSnackBar(
            context: context,
            message: state.message,
            backgroundColor: ColorsManger.success,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
