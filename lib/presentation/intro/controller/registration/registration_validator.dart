import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/validator/wtw_validator.dart';

class RegistrationValidator {

  static String? usernameValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'username'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.containsEmptySpace(key: 'username'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.missingSign(key: 'username'.tr, value: v, sign: '.');
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.minimumLength(key: 'username'.tr, value: v, length: 6);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? passwordValidator(String v) {
    String? error = '';
    error = WTWValidator.isEmpty(key: 'password'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.containsEmptySpace(key: 'password'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.minimumLength(key: 'password'.tr, value: v, length: 12);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

}