import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/text_styles.dart';

class OtpInputField extends StatelessWidget {
  const OtpInputField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.isFirst,
    required this.isLast,
  });

  final TextEditingController controller;
  final Function(String) onChanged;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: controller.text.isNotEmpty
            ? ColorsManger.otpFieldFilled
            : ColorsManger.surface,
        border: Border.all(
          color: controller.text.isNotEmpty
              ? ColorsManger.otpFieldFocused
              : ColorsManger.otpFieldBorder,
          width: controller.text.isNotEmpty ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        style: TextStyles.font28OtpInput,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        onChanged: (value) {
          onChanged(value);
          if (value.isNotEmpty && !isLast) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && !isFirst) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
