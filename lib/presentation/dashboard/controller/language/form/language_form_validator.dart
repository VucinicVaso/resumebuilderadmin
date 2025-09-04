import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/validator/wtw_validator.dart';

class LanguageFormValidator {

  static String? validateTitle(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'title'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? validateLevel(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'level'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.containsEmptySpace(key: 'level'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

}