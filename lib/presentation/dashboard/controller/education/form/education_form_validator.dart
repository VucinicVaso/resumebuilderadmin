class EducationFormValidator {

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

  static String? descriptionValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'description'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  static String? dateTimeValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'dateTime'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

}