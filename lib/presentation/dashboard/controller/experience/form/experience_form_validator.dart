import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/validator/wtw_validator.dart';

class ExperienceFormValidator {

  static String? titleValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'title'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? linkValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'link'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.containsEmptySpace(key: 'link'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? positionValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'position'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.containsEmptySpace(key: 'position'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? descriptionValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'description'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? dateFromValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'dateFrom'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? dateToValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'dateTo'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? totalTimeValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'totalTime'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

}