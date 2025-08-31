import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../../domain/entity/experience/experience.dart';
import '../../../../../domain/usecase/experience_get_by_key_usecase.dart';
import '../../../../../domain/usecase/experience_insert_usecase.dart';
import '../../../../../domain/usecase/experience_update_usecase.dart';

class ExperienceFormController extends WTWController<ExperienceFormController> {

  ExperienceFormController() {
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
    positionController    = TextEditingController(text: entity!.position ?? '')..addListener(positionListener);
    descriptionController = TextEditingController(text: entity!.description ?? '')..addListener(descriptionListener);
    dateFromController    = TextEditingController(text: entity!.dateFrom ?? '')..addListener(dateFromListener);
    dateToController      = TextEditingController(text: entity!.dateTo ?? '')..addListener(dateToListener);
    totalTimeController   = TextEditingController(text: entity!.totalTime ?? '')..addListener(totalTimeListener);
  }

  Future<void> closeForm() async {
    setFormKey();
    entity = Experience().empty();

    titleController!..clear()..removeListener(titleListener);
    linkController!..clear()..removeListener(linkListener);
    positionController!..clear()..removeListener(positionListener);
    descriptionController!..clear()..removeListener(descriptionListener);
    dateFromController!..clear()..removeListener(dateFromListener);
    dateToController!..clear()..removeListener(dateToListener);
    totalTimeController!..clear()..removeListener(totalTimeListener);
  }

  GlobalKey<FormState>? formKey;
  void setFormKey() { formKey = GlobalKey<FormState>(); }

  Experience? entity;
  Future<void> setEntity() async {
    try {
      entity = params!.containsKey('key')
        ? await ExperienceGetByKeyUseCase().call(ExperienceGetByKeyUseCaseParams(key: int.parse(params!['key'])))
        : Experience().empty();
    } catch (e) {
      WTWLogger.write('ExperienceFormController.setEntity() faild: $e');
    }
  }
    
  TextEditingController? titleController = TextEditingController();
  void titleListener() { entity!.title = titleController!.text; }

  TextEditingController? linkController = TextEditingController();
  void linkListener() { entity!.link = linkController!.text; }

  TextEditingController? positionController = TextEditingController();
  void positionListener() { entity!.position = positionController!.text; }

  TextEditingController? descriptionController = TextEditingController();
  void descriptionListener() { entity!.description = descriptionController!.text; }

  TextEditingController? dateFromController = TextEditingController();
  void dateFromListener() { entity!.dateFrom = dateFromController!.text; }

  TextEditingController? dateToController = TextEditingController();
  void dateToListener() { entity!.dateTo = dateToController!.text; }

  TextEditingController? totalTimeController = TextEditingController();
  void totalTimeListener() { entity!.totalTime = totalTimeController!.text; }

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
      bool? response = await ExperienceInsertUseCase().call(ExperienceInsertUseCaseParams(entity: entity!));
      return response;
    } catch(e) {
      WTWLogger.write('ExperienceFormController.insert() faild: $e');
      return false;
    }
  }

  Future<bool> edit() async {
    try {
      bool? response = await ExperienceUpdateUseCase().call(ExperienceUpdateUseCaseParams(entity: entity!));
      return response;
    } catch(e) {
      WTWLogger.write('ExperienceFormController.update() faild: $e');
      return false;
    }
  }

}