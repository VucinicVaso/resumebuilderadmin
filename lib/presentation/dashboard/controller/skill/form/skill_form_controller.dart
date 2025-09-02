import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../../domain/entity/skill/skill.dart';
import '../../../../../domain/usecase/skill/skill_get_by_key_usecase.dart';
import '../../../../../domain/usecase/skill/skill_insert_usecase.dart';
import '../../../../../domain/usecase/skill/skill_update_usecase.dart';

class SkillFormController extends WTWController<SkillFormController> {

  SkillFormController() {
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

    titleController     = TextEditingController(text: entity!.title ?? '')..addListener(titleListener);
    iconController      = TextEditingController(text: entity!.title ?? '')..addListener(iconListener);
    subskillsController = TextEditingController(text: entity!.title ?? '')..addListener(subskillsListener);
  }

  Future<void> closeForm() async {
    setFormKey();
    entity = Skill().empty();

    titleController!..clear()..removeListener(titleListener);
    iconController!..clear()..removeListener(iconListener);
    subskillsController!..clear()..removeListener(subskillsListener);
  }

  GlobalKey<FormState>? formKey;
  void setFormKey() { formKey = GlobalKey<FormState>(); }

  Skill? entity;
  Future<void> setEntity() async {
    try {
      entity = params!.containsKey('key')
        ? await SkillGetByKeyUseCase().call(SkillGetByKeyUseCaseParams(key: int.parse(params!['key'])))
        : Skill().empty();
    } catch (e) {
      WTWLogger.write('SkillFormController.setEntity() faild: $e');
    }
  }
    
  TextEditingController? titleController = TextEditingController();
  void titleListener() { entity!.title = titleController!.text; }

  TextEditingController? iconController = TextEditingController();
  void iconListener() { entity!.icon = iconController!.text; }

  TextEditingController? subskillsController = TextEditingController();
  void subskillsListener() { entity!.subskills!.add(subskillsController!.text); }

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
      bool? response = await SkillInsertUseCase().call(SkillInsertUseCaseParams(entity: entity!));
      return response;
    } catch(e) {
      WTWLogger.write('SkillFormController.insert() faild: $e');
      return false;
    }
  }

  Future<bool> edit() async {
    try {
      bool? response = await SkillUpdateUseCase().call(SkillUpdateUseCaseParams(entity: entity!));
      return response;
    } catch(e) {
      WTWLogger.write('SkillFormController.update() faild: $e');
      return false;
    }
  }

}