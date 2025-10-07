import 'package:e_commerce_task/core/constants/spacing.dart';
import 'package:flutter/material.dart';

void showErrorDialog(
  BuildContext parentContext, {
  required String errorMessage,
}) {
  showDialog(
    context: parentContext,
    builder: (BuildContext context) {
      return Dialog(
        insetAnimationCurve: Curves.elasticOut,
        insetAnimationDuration: const Duration(milliseconds: 200),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 80),
              verticalSpace(16),
              Text(
                errorMessage,
                textAlign: TextAlign.start,
                // style:
                //  isDark
                //     ? TextStyles.font14WhiteBold
                //     : TextStyles.font14BlackBold,
              ),
            ],
          ),
        ),
      );
    },
  );
}
