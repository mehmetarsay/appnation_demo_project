
import 'package:flutter/material.dart';
import 'package:appnation_demo_project/core/init/theme/app_theme.dart';
class AppThemeLight extends AppTheme  {
  static AppThemeLight? _instance;

  static AppThemeLight? get instance {
    _instance ??= AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
      colorScheme: ColorScheme.light(
          primary: Colors.black,
        onPrimary: Colors.white
      ),
appBarTheme: AppBarTheme(
  backgroundColor: Colors.white
),
    buttonColor: Colors.black
  );
}
