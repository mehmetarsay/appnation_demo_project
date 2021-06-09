import 'package:appnation_demo_project/core/constants/enums/app_theme_enum.dart';
import 'package:appnation_demo_project/core/init/theme/app_theme_dark.dart';
import 'package:appnation_demo_project/core/init/theme/app_theme_light.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData? _currentTheme = AppThemeLight.instance?.theme;
  ThemeData? get currentTheme => _currentTheme;


  void changeValue() {
    if(currentTheme == AppThemeLight.instance?.theme){
      _currentTheme = AppThemeDark.instance?.theme;
    }
    else
      _currentTheme = AppThemeLight.instance?.theme;
    notifyListeners();
  }

}
