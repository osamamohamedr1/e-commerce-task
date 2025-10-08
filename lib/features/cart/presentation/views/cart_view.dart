import 'package:flutter/material.dart';
import 'package:e_commerce_task/core/utils/text_styles.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Shopping Cart', style: TextStyles.font20PrimaryBold),
        centerTitle: false,
      ),
    );
  }
}
