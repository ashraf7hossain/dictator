import 'package:flutter/material.dart';
import 'package:myapp/core/theme/app_pallete.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.darkBackgroundColor,
    // useMaterial3: true,
  );

  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.lightBackgroundColor,
    // useMaterial3: true,
  );
}
