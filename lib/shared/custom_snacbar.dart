import 'package:flutter/material.dart';
import 'package:hollypalm_case_app/core/constants/constants.dart';

void showCustomSnackbar(
  BuildContext context,
  String message, {
  Color backgroundColor = AppConstants.snacBarGreen, // Varsayılan yeşil
}) {
  final snackBar = SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}