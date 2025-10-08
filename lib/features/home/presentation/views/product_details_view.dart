import 'package:e_commerce_task/core/constants/spacing.dart';
import 'package:e_commerce_task/features/home/data/models/product_model.dart';
import 'package:e_commerce_task/features/home/presentation/views/widgets/add_to_cart_button.dart';
import 'package:e_commerce_task/features/home/presentation/views/widgets/price_rating_section.dart';
import 'package:e_commerce_task/features/home/presentation/views/widgets/product_description_section.dart';
import 'package:e_commerce_task/features/home/presentation/views/widgets/product_details_app_bar.dart';
import 'package:e_commerce_task/features/home/presentation/views/widgets/product_image_widget.dart';
import 'package:e_commerce_task/features/home/presentation/views/widgets/product_info_chips.dart';
import 'package:e_commerce_task/features/home/presentation/views/widgets/product_specs_section.dart';
import 'package:e_commerce_task/features/home/presentation/views/widgets/product_title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ProductDetailsAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageWidget(imageUrl: product.coverPictureUrl),
            verticalSpace(24),
            ProductTitleSection(name: product.name),
            verticalSpace(20),
            PriceRatingSection(
              price: product.price,
              rating: product.rating,
              reviewsCount: product.reviewsCount,
            ),
            verticalSpace(20),
            ProductInfoChips(
              productCode: product.productCode,
              stock: product.stock,
            ),
            verticalSpace(24),
            ProductDescriptionSection(description: product.description),
            verticalSpace(24),
            ProductSpecsSection(
              weight: product.weight,
              color: product.color,
              categories: product.categories,
            ),
            verticalSpace(32),
            AddToCartButton(productName: product.name),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
