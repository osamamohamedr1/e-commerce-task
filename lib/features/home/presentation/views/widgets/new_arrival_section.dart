import 'package:e_commerce_task/core/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:e_commerce_task/features/home/presentation/views/widgets/product_card.dart';

class NewArrivalSection extends StatelessWidget {
  final List<ProductModel> products;
  final Function(ProductModel)? onFavoritePressed;
  final VoidCallback? onViewAllTap;

  const NewArrivalSection({
    super.key,
    required this.products,
    this.onFavoritePressed,
    this.onViewAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New Arrival',
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
        verticalSpace(16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              product: product,

              onFavoritePressed: () => onFavoritePressed?.call(product),
            );
          },
        ),
      ],
    );
  }
}
