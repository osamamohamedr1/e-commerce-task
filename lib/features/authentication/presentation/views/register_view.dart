import 'package:e_commerce_task/core/constants/spacing.dart';
import 'package:e_commerce_task/core/utils/text_styles.dart';
import 'package:e_commerce_task/core/widgets/custom_button.dart';
import 'package:e_commerce_task/features/authentication/data/models/register_body_model.dart';
import 'package:e_commerce_task/features/authentication/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_task/features/authentication/presentation/views/widgets/have_account.dart';
import 'package:e_commerce_task/features/authentication/presentation/views/widgets/register_form.dart';
import 'package:e_commerce_task/features/authentication/presentation/views/widgets/register_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirController.dispose();
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
              verticalSpace(70.h),
              Text(
                'Create Account',
                style: TextStyles.font24PrimaryBold,
                textAlign: TextAlign.center,
              ),
              verticalSpace(12.h),
              Text(
                'Join us today! Create your account to start\nshopping and enjoy exclusive offers',
                style: TextStyles.font14Secondary,
                textAlign: TextAlign.center,
              ),
              verticalSpace(32.h),
              RegisterForm(
                formKey: formKey,

                emailController: emailController,
                passwordController: passwordController,
                passwordConfirController: passwordConfirController,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
              ),
              verticalSpace(16.h),
              CustomButton(
                text: 'Register',
                onPressed: () => _handleRegister(context),
              ),

              verticalSpace(16.h),
              const HaveAccount(),
              verticalSpace(16.h),
              RegisterBlocListener(getEmail: () => emailController.text.trim()),
            ],
          ),
        ),
      ),
    );
  }

  void _handleRegister(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final firstName = firstNameController.text.trim();
      final lastName = lastNameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      context.read<AuthCubit>().register(
        body: RegisterBodyModel(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
        ),
      );
    }
  }
}
