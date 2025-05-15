import 'package:flutter/material.dart';
import 'package:hollypalm_case_app/core/constants/constants.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: AppConstants.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppConstants.primaryColor,
      foregroundColor: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
  );
}
