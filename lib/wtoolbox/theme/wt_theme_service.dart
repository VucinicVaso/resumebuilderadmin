import 'package:flutter/material.dart';
import 'wt_theme_extension.dart';
import 'wt_theme.dart';

enum WTThemeEnums {
  light,
  dark
}

abstract class WTThemeService {

  WTTheme? lightTheme;
  void setLightTheme(WTTheme? wtTheme);
  void useLightTheme();

  WTTheme? darkTheme;
  void setDarkTheme(WTTheme? wtTheme);
  void useDarkTheme();

  WTTheme? theme;
  ThemeData? themeData;
  WTThemeExtension? themeExtension;

  void setTheme({ WTThemeEnums? wtType, WTTheme? wtTheme });

}
