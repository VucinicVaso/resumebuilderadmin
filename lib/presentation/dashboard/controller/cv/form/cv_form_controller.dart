import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../../domain/entity/cv/cv.dart';
import '../../../../../domain/usecase/cv/cv_insert_usecase.dart';

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
    entity = CV().empty();
  }
  
  Future<void> submit() async {
    final FormState? form    = formKey!.currentState;
    final bool formValidated = form!.validate();

    if(!formValidated) {
      WTWLogger.write('errorMessage'.tr);
      formKey!.currentState!.reset();
    }

    if(formValidated) {
      try {
        bool? response = await CVInsertUseCase().call(CVInsertUseCaseParams(entity: entity!));
        if(response) { formKey!.currentState!.reset(); }
      } catch(e) {
        WTWLogger.write('CVFormController.submit() faild: $e');
      }
    }
  }

}