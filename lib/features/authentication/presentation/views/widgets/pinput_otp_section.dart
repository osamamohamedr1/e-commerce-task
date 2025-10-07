import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/text_styles.dart';

class PinputOtpSection extends StatefulWidget {
  const PinputOtpSection({
    super.key,
    required this.onOtpChanged,
    required this.onCompleted,
    this.controller,
  });

  final Function(String) onOtpChanged;
  final Function(String) onCompleted;
  final TextEditingController? controller;

  @override
  State<PinputOtpSection> createState() => _PinputOtpSectionState();
}

class _PinputOtpSectionState extends State<PinputOtpSection> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    pinController = widget.controller ?? TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      pinController.dispose();
    }
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = ColorsManger.primary;
    const fillColor = ColorsManger.surface;
    const borderColor = ColorsManger.otpFieldBorder;

    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyles.font28OtpInput,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: borderColor),
        color: fillColor,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: focusedBorderColor, width: 2),
      borderRadius: BorderRadius.circular(12.r),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: ColorsManger.otpFieldFilled,
        border: Border.all(color: focusedBorderColor, width: 2),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: ColorsManger.error, width: 2),
      ),
    );

    return Column(
      children: [
        Text(
          'Enter 6-digit verification code',
          style: TextStyles.font16Primary,
          textAlign: TextAlign.center,
        ),
        verticalSpace(32),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            controller: pinController,
            focusNode: focusNode,
            length: 6,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            errorPinTheme: errorPinTheme,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onChanged: widget.onOtpChanged,
            onCompleted: widget.onCompleted,
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 9.h),
                  width: 22.w,
                  height: 1.h,
                  color: focusedBorderColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
