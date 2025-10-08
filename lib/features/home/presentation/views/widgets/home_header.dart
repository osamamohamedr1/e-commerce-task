import 'package:e_commerce_task/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Icon(Icons.menu, size: 24.sp, color: const Color(0xFF1A1A1A)),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: SvgPicture.asset(Assets.svgsCart, width: 20.w, height: 20.h),
        ),
      ],
    );
  }
}
