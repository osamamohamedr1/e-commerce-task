import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_task/core/utils/text_styles.dart';
import 'package:e_commerce_task/core/constants/spacing.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20.h),

              // Welcome Header
              Text('Welcome Back!', style: TextStyles.font24PrimaryBold),
              verticalSpace(8.h),
              Text(
                'Discover amazing products just for you',
                style: TextStyles.font14Secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
