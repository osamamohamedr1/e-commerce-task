import 'package:e_commerce_task/core/routing/routes.dart';
import 'package:e_commerce_task/core/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?  ',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextSpan(
            text: 'Sign Up',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.register);
              },
          ),
        ],
      ),
    );
  }
}
