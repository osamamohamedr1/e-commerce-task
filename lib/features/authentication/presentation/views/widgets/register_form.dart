import 'package:e_commerce_task/core/constants/spacing.dart';
import 'package:e_commerce_task/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.passwordConfirController,
    required this.firstNameController,
    required this.lastNameController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirController;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isSecure = true;
  bool isConfirmSecure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) {
              FocusScope.of(context).nextFocus();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter first name';
              }
              return null;
            },
            controller: widget.firstNameController,
            keyboardType: TextInputType.text,
            hintText: 'First Name',
          ),
          verticalSpace(20),
          CustomTextFormField(
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) {
              FocusScope.of(context).nextFocus();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter last name';
              }
              return null;
            },
            controller: widget.lastNameController,
            keyboardType: TextInputType.text,
            hintText: 'Last Name',
          ),
          verticalSpace(20),
          CustomTextFormField(
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) {
              FocusScope.of(context).nextFocus();
            },
            validator: (value) {
              if (value == null || value.isEmpty || !value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Email',
          ),

          verticalSpace(20),

          CustomTextFormField(
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) {
              FocusScope.of(context).nextFocus();
            },
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 6) {
                return 'Password must be at least 6 characters';
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
          verticalSpace(20),
          // CustomTextFormField(
          //   textInputAction: TextInputAction.done,
          //   onFieldSubmitted: (value) {
          //     FocusScope.of(context).unfocus();
          //   },
          //   validator: (value) {
          //     if (value == null ||
          //         value.isEmpty ||
          //         widget.passwordConfirController.text !=
          //             widget.passwordController.text) {
          //       return 'Password not match';
          //     }
          //     return null;
          //   },
          //   controller: widget.passwordConfirController,
          //   keyboardType: TextInputType.visiblePassword,
          //   suffixIcon: IconButton(
          //     onPressed: () {
          //       setState(() {
          //         isConfirmSecure = !isConfirmSecure;
          //       });
          //     },
          //     icon: Icon(
          //       isConfirmSecure ? Icons.visibility_off : Icons.visibility,
          //     ),
          //   ),
          //   obscureText: isConfirmSecure,
          //   hintText: 'Confirm Password',
          // ),
          // verticalSpace(8),
          // Text(
          //   'Note: The password must be at least 6 characters long.',
          //   style: Theme.of(context).textTheme.labelSmall,
          // ),
        ],
      ),
    );
  }
}
