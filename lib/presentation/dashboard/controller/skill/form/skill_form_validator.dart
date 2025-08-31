import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/validator/wtw_validator.dart';

class SkillFormValidator {

  static String? titleValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'title'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? iconValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'icon'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? subskillsValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'subskills'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

}