import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.controller,
    this.keyboardType,
    required this.validator,
    this.onFieldSubmitted,
    this.textInputAction,
  });
  final String? hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        return validator!(value);
      },
      obscureText: obscureText ?? false,
      style: Theme.of(context).textTheme.labelLarge,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        suffixIcon: suffixIcon,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        fillColor: ColorsManger.background,
        hintStyle: Theme.of(context).textTheme.labelSmall,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: .3, color: ColorsManger.hintText),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 1, color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 1.4, color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
      ),
    );
  }
}
