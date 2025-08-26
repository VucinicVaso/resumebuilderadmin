import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import 'package:wtoolboxweb/validator/wtw_validator.dart';
import '../../../../../domain/entity/cv/cv.dart';
import '../../../../../domain/usecase/cv_get_by_key_usecase.dart';
import '../../../../../domain/usecase/cv_insert_usecase.dart';
import '../../../../../domain/usecase/cv_update_usecase.dart';

class CVFormController extends WTWController<CVFormController> {

  CVFormController() {
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
  }

  Future<void> closeForm() async {
    setFormKey();
    entity = CV().empty();
  }

  GlobalKey<FormState>? formKey;
  void setFormKey() { formKey = GlobalKey<FormState>(); }

  CV? entity;
  Future<void> setEntity() async {
    try {
      entity = params!.containsKey('key')
        ? await CVGetByKeyUseCase().call(CVGetByKeyUseCaseParams(key: int.parse(params!['key'])))
        : CV().empty();
    } catch (e) {
      WTWLogger.write('CVFormController.setEntity() faild: $e');
    }
  }
  
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
      bool? response = await CVInsertUseCase().call(CVInsertUseCaseParams(entity: entity!));
      return response;
    } catch(e) {
      WTWLogger.write('CVFormController.insert() faild: $e');
      return false;
    }
  }

  Future<bool> edit() async {
    try {
      bool? response = await CVUpdateUseCase().call(CVUpdateUseCaseParams(entity: entity!));
      return response;
    } catch(e) {
      WTWLogger.write('CVFormController.update() faild: $e');
      return false;
    }
  }

}