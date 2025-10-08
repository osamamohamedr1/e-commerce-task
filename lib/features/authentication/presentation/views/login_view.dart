import 'package:e_commerce_task/core/constants/spacing.dart';
import 'package:e_commerce_task/core/utils/assets.dart';
import 'package:e_commerce_task/core/utils/text_styles.dart';
import 'package:e_commerce_task/core/widgets/custom_button.dart';

import 'package:e_commerce_task/features/authentication/presentation/bloc/login_cubit/auth_cubit.dart';
import 'package:e_commerce_task/features/authentication/presentation/views/widgets/dont_have_account.dart';
import 'package:e_commerce_task/features/authentication/presentation/views/widgets/login_bloc_listener.dart';
import 'package:e_commerce_task/features/authentication/presentation/views/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(60.h),
                Image.asset(
                  Assets.imagesLogo,
                  height: 100.h,
                  fit: BoxFit.contain,
                ),
                verticalSpace(32.h),
                Text(
                  'Welcome Back!',
                  style: TextStyles.font24PrimaryBold.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(8.h),
                Text(
                  'Sign in to your account to continue shopping.',
                  style: TextStyles.font14Secondary.copyWith(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(30.h),

                LoginForm(
                  formKey: formKey,
                  userNameController: userNameController,
                  passwordController: passwordController,
                ),
                verticalSpace(24.h),
                CustomButton(
                  text: 'Sign In',
                  onPressed: () => _handleLogin(context),
                ),
                verticalSpace(32.h),
                const DontHaveAccount(),
                verticalSpace(20.h),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final username = userNameController.text.trim();
      final password = passwordController.text.trim();

      context.read<AuthCubit>().login(email: username, password: password);
    }
  }
}
