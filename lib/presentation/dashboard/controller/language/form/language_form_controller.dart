import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/base/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../../domain/entity/language/language.dart';
import '../../../../../domain/usecase/language/language_get_by_key_usecase.dart';
import '../../../../../domain/usecase/language/language_insert_usecase.dart';
import '../../../../../domain/usecase/language/language_update_usecase.dart';

class LanguageFormController extends WTWController<LanguageFormController> {

  LanguageFormController() {
    init();
    initState();
  }

  @override
  Future<void> initState() async {
    await initForm();
  }

  @override
  Future<void> clearState() async {
    await closeForm();
  }

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

  Future<void> initForm() async {
    setFormKey();
    await setEntity();

    titleController = TextEditingController(text: entity!.title ?? '')..addListener(titleListener);
    levelController = TextEditingController(text: entity!.level ?? '')..addListener(levelListener);
  }

  Future<void> closeForm() async {
    setFormKey();
    entity = Language().empty();

    titleController!..clear()..removeListener(titleListener);
    levelController!..clear()..removeListener(levelListener);
  }

  GlobalKey<FormState>? formKey;
  void setFormKey() { formKey = GlobalKey<FormState>(); }

  Language? entity;
  Future<void> setEntity() async {
    try {
      entity = params!.containsKey('key')
        ? await LanguageGetByKeyUseCase().call(LanguageGetByKeyUseCaseParams(key: int.parse(params!['key'])))
        : Language().empty();
    } catch (e) {
      WTWLogger.write('LanguageFormController.setEntity() faild: $e');
    }
  }

  TextEditingController? titleController = TextEditingController();
  void titleListener() { entity!.title = titleController!.text; }

  TextEditingController? levelController = TextEditingController();
  void levelListener() { entity!.level = levelController!.text; }

  Future<void> submit() async {
    final FormState? form    = formKey!.currentState;
    final bool formValidated = form!.validate();

    if(!formValidated) {
      WTWLogger.write('errorMessage'.tr);
      formKey!.currentState!.reset();
    }

    if(formValidated) {
      bool? response = params!.containsKey('key') ? await insert() : await edit();
      if(response) { formKey!.currentState!.reset(); }
    }
  }

  Future<bool> insert() async {
    try {
      bool? response = await LanguageInsertUseCase().call(LanguageInsertUseCaseParams(entity: entity!));
      return response;
    } catch(e) {
      WTWLogger.write('LanguageFormController.insert() faild: $e');
      return false;
    }
  }

  Future<bool> edit() async {
    try {
      bool? response = await LanguageUpdateUseCase().call(LanguageUpdateUseCaseParams(entity: entity!));
      return response;
    } catch(e) {
      WTWLogger.write('LanguageFormController.update() faild: $e');
      return false;
    }
  }

}