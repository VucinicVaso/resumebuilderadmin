import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../../domain/entity/education/education.dart';
import '../../../../../domain/usecase/education_get_by_key_usecase.dart';
import '../../../../../domain/usecase/education_insert_usecase.dart';
import '../../../../../domain/usecase/education_update_usecase.dart';

class EducationFormController extends WTWController<EducationFormController> {

  EducationFormController() {
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

    titleController       = TextEditingController(text: entity!.title ?? '')..addListener(titleListener);
    linkController        = TextEditingController(text: entity!.link ?? '')..addListener(linkListener);
    descriptionController = TextEditingController(text: entity!.description ?? '')..addListener(descriptionListener);
    dateTimeController    = TextEditingController(text: entity!.dateTime ?? '')..addListener(dateTimeListener);
  }

  Future<void> closeForm() async {
    setFormKey();
    entity = Education().empty();

    titleController!..clear()..removeListener(titleListener);
    linkController!..clear()..removeListener(linkListener);
    descriptionController!..clear()..removeListener(descriptionListener);
    dateTimeController!..clear()..removeListener(dateTimeListener);
  }

  GlobalKey<FormState>? formKey;
  void setFormKey() { formKey = GlobalKey<FormState>(); }

  Education? entity;
  Future<void> setEntity() async {
    try {
      entity = params!.containsKey('key')
        ? await EducationGetByKeyUseCase().call(EducationGetByKeyUseCaseParams(key: int.parse(params!['key'])))
        : Education().empty();
    } catch (e) {
      WTWLogger.write('EducationFormController.setEntity() faild: $e');
    }
  }

  TextEditingController? titleController = TextEditingController();
  void titleListener() { entity!.title = titleController!.text; }

  TextEditingController? linkController = TextEditingController();
  void linkListener() { entity!.link = linkController!.text; }

  TextEditingController? descriptionController = TextEditingController();
  void descriptionListener() { entity!.description = descriptionController!.text; }

  TextEditingController? dateTimeController = TextEditingController();
  void dateTimeListener() { entity!.dateTime = dateTimeController!.text; }

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
      bool? response = await EducationInsertUseCase().call(EducationInsertUseCaseParams(entity: entity!));
      return response;
    } catch(e) {
      WTWLogger.write('EducationFormController.insert() faild: $e');
      return false;
    }
  }

  Future<bool> edit() async {
    try {
      bool? response = await EducationUpdateUseCase().call(EducationUpdateUseCaseParams(entity: entity!));
      return response;
    } catch(e) {
      WTWLogger.write('EducationFormController.update() faild: $e');
      return false;
    }
  }

}