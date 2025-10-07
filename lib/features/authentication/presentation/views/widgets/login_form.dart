import 'package:e_commerce_task/core/constants/spacing.dart';
import 'package:e_commerce_task/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.userNameController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController userNameController;
  final TextEditingController passwordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: widget.userNameController,
            keyboardType: TextInputType.text,
            hintText: 'Email',
          ),
          verticalSpace(20),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
            controller: widget.passwordController,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isSecure = !isSecure;
                });
              },
              icon: Icon(isSecure ? Icons.visibility_off : Icons.visibility),
            ),
            obscureText: isSecure,
            hintText: 'Password',
          ),
          verticalSpace(8),
        ],
      ),
    );
  }
}
