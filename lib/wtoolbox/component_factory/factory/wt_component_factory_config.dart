import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/wtoolbox/theme/wt_theme_extension.dart';

mixin WTComponentFactoryConfig {

  String? translate(String? v) { return '$v'.tr; }

  BuildContext? getCurrentContext() { return Get.key.currentContext; }

  void closeModal() { Get.back(); }

  String? fonts;
  void setTextFont({ String? type, String? font }) {
    if(type == 'Google') { fonts = font; }
  }

  WTThemeExtension? theme;
  void setTheme(WTThemeExtension? v) { theme = v; }

}
