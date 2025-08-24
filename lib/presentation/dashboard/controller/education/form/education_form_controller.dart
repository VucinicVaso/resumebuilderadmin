import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import 'package:wtoolboxweb/validator/wtw_validator.dart';
import '../../../../../domain/entity/education/education.dart';
import '../../../../../domain/usecase/education_get_by_key_usecase.dart';
import '../../../../../domain/usecase/education_insert_usecase.dart';
import '../../../../../domain/usecase/education_update_usecase.dart';

class EducationFormController extends WTWController<EducationFormController> {

  EducationFormController() {
    init(arguments: Get.arguments);
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

  GlobalKey<FormState>? formKey;
  void setFormKey() { formKey = GlobalKey<FormState>(); }

  Education? education;

  Future<void> initForm() async {
    setFormKey();

    education = params!.containsKey('key')
      ? await EducationGetByKeyUseCase().call(EducationGetByKeyUseCaseParams(key: params!['key']))
      : Education().empty();

    titleController       = TextEditingController(text: education!.title)..addListener(titleListener);
    linkController        = TextEditingController(text: education!.link)..addListener(linkListener);
    descriptionController = TextEditingController(text: education!.description)..addListener(descriptionListener);
    dateTimeController    = TextEditingController(text: education!.dateTime)..addListener(dateTimeListener);
  }
  Future<void> closeForm() async {
    setFormKey();

    education = Education().empty();

    titleController!..clear()..removeListener(titleListener);
    linkController!..clear()..removeListener(linkListener);
    descriptionController!..clear()..removeListener(descriptionListener);
    dateTimeController!..clear()..removeListener(dateTimeListener);
  }

  TextEditingController? titleController = TextEditingController();
  void titleListener() { education!.title = titleController!.text; }
  titleValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'title'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  TextEditingController? linkController = TextEditingController();
  void linkListener() { education!.link = titleController!.text; }
  linkValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'link'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.containsEmptySpace(key: 'link'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  TextEditingController? descriptionController = TextEditingController();
  void descriptionListener() { education!.description = titleController!.text; }
  descriptionValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'description'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  TextEditingController? dateTimeController = TextEditingController();
  void dateTimeListener() { education!.dateTime = titleController!.text; }
  dateTimeValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'dateTime'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    return null;
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
      bool? response = await EducationInsertUseCase().call(EducationInsertUseCaseParams(entity: education!));
      return response;
    }catch(e) {
      WTWLogger.write('EducationFormController.insert() faild: $e');
      return false;
    }
  }

  Future<bool> edit() async {
    try {
      bool? response = await EducationUpdateUseCase().call(EducationUpdateUseCaseParams(entity: education!));
      return response;
    }catch(e) {
      WTWLogger.write('EducationFormController.update() faild: $e');
      return false;
    }
  }

}