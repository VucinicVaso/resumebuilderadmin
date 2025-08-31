import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/validator/wtw_validator.dart';

class AccountValidator {

  static String? firstnameValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'firstname'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? lastnameValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'lastname'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? emailValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'email'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? imageValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'image'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? dateOfBirthValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'dateOfBirth'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? cityValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'city'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? countryValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'country'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

}