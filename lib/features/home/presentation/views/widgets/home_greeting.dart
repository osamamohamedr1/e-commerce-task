import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeGreeting extends StatelessWidget {
  const HomeGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
          ),
        ),

        Text(
          'Welcome to Laza.',
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF8F959E),
          ),
        ),
      ],
    );
  }
}
