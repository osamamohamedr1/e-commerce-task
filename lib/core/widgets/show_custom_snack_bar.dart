import 'package:flutter/material.dart';

showCustomSnackBar({
  required BuildContext context,
  required String message,
  Color backgroundColor = Colors.blue,
}) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: backgroundColor,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
