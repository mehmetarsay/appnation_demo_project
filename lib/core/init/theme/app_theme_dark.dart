import 'package:appnation_demo_project/core/init/theme/app_theme.dart';
import 'package:appnation_demo_project/core/init/theme/app_theme_light.dart';
import 'package:flutter/material.dart';

class AppThemeDark extends AppTheme  {
  static AppThemeDark? _instance;

  static AppThemeDark? get instance {
    _instance ??= AppThemeDark._init();
    return _instance;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
    colorScheme: ColorScheme.dark(
          primary: Colors.white,
      onPrimary: Colors.black
    ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.black.withOpacity(0.5)
      ),
splashColor: Colors.grey
  );
}