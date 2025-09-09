import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/theme/wtw_theme_service.dart';
import 'package:wtoolboxweb/translation/wtw_translation.dart';
import '../../../../domain/entity/account/account.dart';
import '../../../../domain/usecase/account/account_get_usecase.dart';
import '../../../../domain/usecase/account/account_update_usecase.dart';

class SettingsController extends WTWController<SettingsController> {

  SettingsController() {
    init();
    initState();
  }

  @override
  Future<void> initState() async {
    setFormKey();
    await setEntity();
    setLanguages();
    setThemes();

    languageController = TextEditingController(text: entity.value!.language ?? '')..addListener(languageListener);
    themeController    = TextEditingController(text: entity.value!.theme ?? '')..addListener(themeListener);
  }

  @override
  Future<void> clearState() async {
    setFormKey();
    entity.value = Account().empty()!;
    languages.clear();
    themes.clear();

    languageController!..clear()..removeListener(languageListener);
    themeController!..clear()..removeListener(themeListener);
  }

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

  var entity = Account().empty().obs;
  Future<void> setEntity() async {
    entity.value = await AccountGetUseCase().call();
  }

  GlobalKey<FormState>? formKey;
  void setFormKey() { formKey = GlobalKey<FormState>(); }

  Future<void> submit() async {
    try {
      entity.value!
        ..setLanguage(language)
        ..setTheme(theme);

      bool? response = await AccountUpdateUseCase().call(AccountUpdateUseCaseParams(entity: entity.value));
      if(response) {
        await updateLanguage();
        await updateTheme();
      }
    } catch(e) {
      WTWLogger.write('SettingsController.submit() error: $e');
    }
  }

  String? language = '';
  TextEditingController? languageController = TextEditingController();
  void languageListener() { language = languageController!.text; }

  var languages = List<Map<String, dynamic>>.empty(growable: true).obs;
  void setLanguages() {
    List<dynamic> list = jsonDecode('languages'.tr);
    List<Map<String, dynamic>> list2 = List<Map<String, dynamic>>.empty(growable: true);

    if(list.isNotEmpty) {
      for(var l in list) {
        if(l['label'] == entity.value!.language) { list2.add({ 'key': l['key'], 'label': l['language'], 'image': '', 'selected': true }); }
        if(l['label'] != entity.value!.language) { list2.add({ 'key': l['key'], 'label': l['language'], 'image': '', 'selected': false }); }
      }
    }

    languages.addAll(list2);
  }
  Future<void> updateLanguage() async {
    Get.find<WTWTranslation>().setLocalization(label: entity.value!.language!);
  }

  String? theme = '';
  TextEditingController? themeController = TextEditingController();
  void themeListener() { theme = themeController!.text; }

  var themes = List<Map<String, dynamic>>.empty(growable: true).obs;
  void setThemes() {
    List<Map> list = Get.find<WTWThemeService>().getThemes()!;
    List<Map<String, dynamic>> list2 = List<Map<String, dynamic>>.empty(growable: true);

    if(list.isNotEmpty) {
      for(var l in list) {
        if(l['name'] == entity.value!.theme) { list2.add({ 'key': l['key'], 'label': l['name'], 'image': '', 'selected': true }); }
        if(l['name'] != entity.value!.theme) { list2.add({ 'key': l['key'], 'label': l['name'], 'image': '', 'selected': false }); }
      }
    }

    themes.addAll(list2);
  }
  Future<void> updateTheme() async {
    Get.find<WTWThemeService>().updateTheme(entity.value!.theme);
  }

}