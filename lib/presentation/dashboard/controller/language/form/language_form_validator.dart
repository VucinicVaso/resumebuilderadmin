import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/validator/wtw_validator.dart';

class LanguageFormValidator {

  static String? titleValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'title'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? levelValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'level'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.containsEmptySpace(key: 'level'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

}