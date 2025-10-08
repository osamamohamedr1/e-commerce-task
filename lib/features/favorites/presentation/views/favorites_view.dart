import 'package:flutter/material.dart';
import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/core/utils/text_styles.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.background,
      appBar: AppBar(
        backgroundColor: ColorsManger.background,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text('Favorites', style: TextStyles.font20PrimaryBold),
        centerTitle: false,
      ),
    );
  }
}
