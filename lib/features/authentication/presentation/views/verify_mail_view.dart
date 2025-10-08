import 'dart:developer';

import 'package:e_commerce_task/core/constants/spacing.dart';
import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/core/widgets/show_custom_snack_bar.dart';
import 'package:e_commerce_task/features/authentication/presentation/bloc/otp_cubit/otp_cubit.dart';
import 'package:e_commerce_task/features/authentication/presentation/views/widgets/verify_email_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/verification_header.dart';
import 'widgets/pinput_otp_section.dart';
import 'widgets/verification_action_buttons.dart';

class VerifyMailView extends StatefulWidget {
  const VerifyMailView({super.key, required this.email});

  final String email;

  @override
  State<VerifyMailView> createState() => _VerifyMailViewState();
}

class _VerifyMailViewState extends State<VerifyMailView> {
  late TextEditingController pinController;
  String currentOtp = '';
  bool isOtpComplete = false;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.email);
    return Scaffold(
      backgroundColor: ColorsManger.background,

      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: ColorsManger.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsManger.primaryText,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(40),

                VerificationHeader(email: widget.email),

                verticalSpace(48),

                PinputOtpSection(
                  controller: pinController,
                  onOtpChanged: _handleOtpChanged,
                  onCompleted: _handleOtpCompleted,
                ),

                verticalSpace(55),

                VerificationActionButtons(
                  onVerify: _handleVerification,
                  isOtpComplete: isOtpComplete,
                ),

                verticalSpace(24),

                VerifyEmailBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleOtpChanged(String otp) {
    setState(() {
      currentOtp = otp;
      isOtpComplete = otp.length == 6;
    });
  }

  void _handleOtpCompleted(String otp) {
    setState(() {
      currentOtp = otp;
      isOtpComplete = true;
    });
    _handleVerification();
  }

  void _handleVerification() {
    if (currentOtp.length != 6) {
      showCustomSnackBar(
        context: context,
        message: 'Please enter complete OTP',
        backgroundColor: ColorsManger.error,
      );
      return;
    }
    // Use OTP Cubit instead of mock logic
    context.read<OtpCubit>().verifyMail(email: widget.email, otp: currentOtp);
  }

  // void _handleResendCode() {
  //   // Use OTP Cubit to resend code
  //   context.read<OtpCubit>().resendOtp(email: widget.email);
  //   _clearOtpFields();
  // }

  // void _clearOtpFields() {
  //   pinController.clear();
  //   setState(() {
  //     currentOtp = '';
  //     isOtpComplete = false;
  //   });
  // }

  // void _clearOtpFields() {
  //   pinController.clear();
  //   setState(() {
  //     currentOtp = '';
  //     isOtpComplete = false;
  //   });
  // }
}
