import 'package:e_commerce_task/core/constants/spacing.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(136.h),
              LoginForm(
                formKey: formKey,
                userNameController: userNameController,
                passwordController: passwordController,
              ),
              verticalSpace(16.h),
              CustomButton(
                text: 'Login',
                onPressed: () => _handleLogin(context),
              ),
              verticalSpace(32.h),
              verticalSpace(50.h),
              const DontHaveAccount(),
              const LoginBlocListener(),
            ],
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
