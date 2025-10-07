import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        backgroundColor: WidgetStateProperty.all(ColorsManger.primary),
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 50)),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyles.font14WhiteBold),
    );
  }
}
