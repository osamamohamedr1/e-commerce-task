import 'package:e_commerce_task/core/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoChips extends StatelessWidget {
  final String productCode;
  final int stock;

  const ProductInfoChips({
    super.key,
    required this.productCode,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _InfoChip(text: 'Code: $productCode'),
        horizontalSpace(12),
        _InfoChip(text: 'Stock: $stock'),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String text;

  const _InfoChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1A1A1A),
        ),
      ),
    );
  }
}
