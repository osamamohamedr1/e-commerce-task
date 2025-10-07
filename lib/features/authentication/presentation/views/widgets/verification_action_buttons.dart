import 'package:e_commerce_task/core/constants/spacing.dart';
import 'package:e_commerce_task/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class VerificationActionButtons extends StatelessWidget {
  const VerificationActionButtons({
    super.key,
    required this.onVerify,
    required this.isOtpComplete,
  });

  final VoidCallback onVerify;
  final bool isOtpComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Verify',
          onPressed: isOtpComplete ? onVerify : null,
        ),
        verticalSpace(16),
      ],
    );
  }
}
