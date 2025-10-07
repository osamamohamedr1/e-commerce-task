import 'package:flutter/material.dart';
import 'colors_manager.dart';

class TextStyles {
  static const TextStyle font14WhiteBold = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle font14BlackBold = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  // Heading styles
  static const TextStyle font24PrimaryBold = TextStyle(
    fontSize: 24,
    color: ColorsManger.primaryText,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle font20PrimaryBold = TextStyle(
    fontSize: 20,
    color: ColorsManger.primaryText,
    fontWeight: FontWeight.bold,
  );

  // Body text styles
  static const TextStyle font16Primary = TextStyle(
    fontSize: 16,
    color: ColorsManger.primaryText,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle font14Secondary = TextStyle(
    fontSize: 14,
    color: ColorsManger.secondaryText,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle font12Hint = TextStyle(
    fontSize: 12,
    color: ColorsManger.hintText,
    fontWeight: FontWeight.w400,
  );

  // OTP specific styles
  static const TextStyle font28OtpInput = TextStyle(
    fontSize: 28,
    color: ColorsManger.primaryText,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle font16PrimaryMedium = TextStyle(
    fontSize: 16,
    color: ColorsManger.primary,
    fontWeight: FontWeight.w500,
  );

  // Success and error styles
  static const TextStyle font14Success = TextStyle(
    fontSize: 14,
    color: ColorsManger.success,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle font14Error = TextStyle(
    fontSize: 14,
    color: ColorsManger.error,
    fontWeight: FontWeight.w500,
  );
}
