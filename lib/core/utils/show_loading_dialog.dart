import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showLoadingDialog(
  BuildContext parentContext, {
  TextAlign? textAlign,
  String? loadingMessage,
}) {
  showDialog(
    barrierDismissible: false,
    context: parentContext,
    builder: (BuildContext context) {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 60.w),
        insetAnimationCurve: Curves.elasticOut,
        insetAnimationDuration: const Duration(milliseconds: 200),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        backgroundColor: isDark ? ColorsManger.darkCard : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              loadingMessage == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        loadingMessage,
                        textAlign: textAlign ?? TextAlign.center,
                        style: isDark
                            ? TextStyles.font14WhiteBold
                            : TextStyles.font14BlackBold,
                      ),
                    ),
            ],
          ),
        ),
      );
    },
  );
}
