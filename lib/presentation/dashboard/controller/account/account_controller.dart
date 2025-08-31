import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../domain/entity/account/account.dart';
import '../../../../domain/usecase/account_get_usecase.dart';
import '../../../../domain/usecase/account_update_usecase.dart';

class AccountController extends WTWController<AccountController> {

  AccountController() {
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

    firstnameController   = TextEditingController(text: entity.value.firstname ?? '')..addListener(firstnameListener);
    lastnameController    = TextEditingController(text: entity.value.lastname ?? '')..addListener(lastnameListener);
    imageController       = TextEditingController(text: entity.value.image ?? '')..addListener(imageListener);
    dateOfBirthController = TextEditingController(text: entity.value.dateOfBirth ?? '')..addListener(dateOfBirthListener);
    cityController        = TextEditingController(text: entity.value.city ?? '')..addListener(cityListener);
    countryController     = TextEditingController(text: entity.value.country ?? '')..addListener(countryListener);
  }

  Future<void> closeForm() async {
    setFormKey();
    entity.value = Account().empty()!;

    firstnameController!..clear()..removeListener(firstnameListener);
    lastnameController!..clear()..removeListener(firstnameListener);
    imageController!..clear()..removeListener(imageListener);
    dateOfBirthController!..clear()..removeListener(dateOfBirthListener);
    cityController!..clear()..removeListener(cityListener);
    countryController!..clear()..removeListener(countryListener);  
  }

  GlobalKey<FormState>? formKey;
  void setFormKey() { formKey = GlobalKey<FormState>(); }

  var entity = Account().obs;
  Future<void> setEntity() async {
    entity.value = await AccountGetUseCase().call();
  }

  TextEditingController? firstnameController = TextEditingController();
  void firstnameListener() { entity.value.firstname = firstnameController!.text; }

  TextEditingController? lastnameController = TextEditingController();
  void lastnameListener() { entity.value.lastname = lastnameController!.text; }

  TextEditingController? emailController = TextEditingController();
  void emailListener() { entity.value.email = emailController!.text; }

  TextEditingController? imageController = TextEditingController();
  void imageListener() { entity.value.image = emailController!.text; }

  TextEditingController? dateOfBirthController = TextEditingController();
  void dateOfBirthListener() { entity.value.dateOfBirth = dateOfBirthController!.text; }

  TextEditingController? cityController = TextEditingController();
  void cityListener() { entity.value.city = cityController!.text; }

  TextEditingController? countryController = TextEditingController();
  void countryListener() { entity.value.country = countryController!.text; }

  Future<void> submit() async {
    final FormState? form    = formKey!.currentState;
    final bool formValidated = form!.validate();

    if(!formValidated) {
      WTWLogger.write('errorMessage'.tr);
      formKey!.currentState!.reset();
    }

    if(formValidated) {
      try {
        bool? response = await AccountUpdateUseCase().call(AccountUpdateUseCaseParams(entity: entity.value));
        if(response) { formKey!.currentState!.reset(); }
      } catch(e) {
        WTWLogger.write('AccountController.submit() faild: $e');
      }
    }
  }

}