import 'package:e_commerce_task/core/constants/spacing.dart';
import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationHeader extends StatelessWidget {
  const VerificationHeader({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Mail Icon
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: ColorsManger.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.email_outlined,
            size: 40.sp,
            color: ColorsManger.primary,
          ),
        ),
        verticalSpace(24),

        // Title
        Text(
          'Verify your email',
          style: TextStyles.font24PrimaryBold,
          textAlign: TextAlign.center,
        ),
        verticalSpace(16),

        // Description
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyles.font14Secondary,
            children: [
              const TextSpan(text: 'We\'ve sent a verification code to\n'),
              TextSpan(text: email, style: TextStyles.font14BlackBold),
            ],
          ),
        ),
      ],
    );
  }
}
