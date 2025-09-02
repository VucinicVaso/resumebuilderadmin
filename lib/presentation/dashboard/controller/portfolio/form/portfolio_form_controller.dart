import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../../domain/entity/portfolio/portfolio.dart';
import '../../../../../domain/usecase/portfolio/portfolio_get_by_key_usecase.dart';
import '../../../../../domain/usecase/portfolio/portfolio_insert_usecase.dart';
import '../../../../../domain/usecase/portfolio/portfolio_update_usecase.dart';

class PortfolioFormController extends WTWController<PortfolioFormController> {

  PortfolioFormController() {
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
    descriptionController = TextEditingController(text: entity!.description ?? '')..addListener(descriptionListener);
    linksController       = TextEditingController(text: '')..addListener(linksListener);
  }

  Future<void> closeForm() async {
    setFormKey();
    entity = Portfolio().empty();

    titleController!..clear()..removeListener(titleListener);
    descriptionController!..clear()..removeListener(titleListener);
    linksController!..clear()..removeListener(titleListener);
  }

  GlobalKey<FormState>? formKey;
  void setFormKey() { formKey = GlobalKey<FormState>(); }

  Portfolio? entity;
  Future<void> setEntity() async {
    try {
      entity = params!.containsKey('key')
        ? await PortfolioGetByKeyUseCase().call(PortfolioGetByKeyUseCaseParams(key: int.parse(params!['key'])))
        : Portfolio().empty();
    } catch (e) {
      WTWLogger.write('PortfolioFormController.setEntity() faild: $e');
    }
  }
    
  TextEditingController? titleController = TextEditingController();
  void titleListener() { entity!.title = titleController!.text; }

  TextEditingController? descriptionController = TextEditingController();
  void descriptionListener() { entity!.description = descriptionController!.text; }

  TextEditingController? linksController = TextEditingController();
  void linksListener() { entity!.links!.add(linksController!.text); }

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
      bool? response = await PortfolioInsertUseCase().call(PortfolioInsertUseCaseParams(entity: entity!));
      return response;
    } catch(e) {
      WTWLogger.write('PortfolioFormController.insert() faild: $e');
      return false;
    }
  }

  Future<bool> edit() async {
    try {
      bool? response = await PortfolioUpdateUseCase().call(PortfolioUpdateUseCaseParams(entity: entity!));
      return response;
    } catch(e) {
      WTWLogger.write('PortfolioFormController.update() faild: $e');
      return false;
    }
  }

}