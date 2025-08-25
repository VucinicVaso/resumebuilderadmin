import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/validator/wtw_validator.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/application_starter/wtw_application_starter_service.dart';
import '../../../../domain/usecase/account_signin_usecase.dart';
import '../../../../domain/usecase/account_signup_usecase.dart';

class RegistrationController extends WTWController<RegistrationController> {

  RegistrationController() {
    init();
    initState();
  }

  @override
  Future<void> initState() async {
    setView(0);
    setFormKey();
    setFormSubmitting(false);

    usernameController = TextEditingController()..addListener(usernameListener);
    passwordController = TextEditingController()..addListener(passwordListener);
  }

  @override
  Future<void> clearState() async {
    setView(0);
    setFormKey();
    setFormSubmitting(false);

    username = '';
    usernameController!..clear()..removeListener(usernameListener);
    password = '';
    passwordController!..clear()..removeListener(passwordListener);
  }

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

  var view = 0.obs;
  void setView(int? v) { view.value = v!; }

  var formSubmitting = false.obs;
  void setFormSubmitting(bool? b) { formSubmitting.value = b!; }

  GlobalKey<FormState>? formKey;
  void setFormKey() { formKey = GlobalKey<FormState>(); }

  String? username;
  TextEditingController? usernameController = TextEditingController();
  void usernameListener() { username = usernameController!.text; }
  usernameValidator(String v) {
    String? error;
    error = WTWValidator.isEmpty(key: 'username'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.containsEmptySpace(key: 'username'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.missingSign(key: 'username'.tr, value: v, sign: '.');
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.minimumLength(key: 'username'.tr, value: v, length: 6);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  String? password;
  TextEditingController? passwordController = TextEditingController();
  void passwordListener() { password = passwordController!.text; }
  passwordValidator(String v) {
    String? error = '';
    error = WTWValidator.isEmpty(key: 'password'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.containsEmptySpace(key: 'password'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTWValidator.minimumLength(key: 'password'.tr, value: v, length: 12);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  Future<void> submit(String? formType) async {
    setFormSubmitting(true);
    final FormState? form    = formKey!.currentState;
    final bool formValidated = form!.validate();

    if(!formValidated) {
      setFormSubmitting(false);
      WTWLogger.write('errorMessage'.tr);
      formKey!.currentState!.reset();
    }

    if(formValidated) {
      bool? response = formType == 'signIn'.tr ? await signIn() : await signUp();
      formKey!.currentState!.reset();
      setFormSubmitting(false);
      if(response) { await start(); }
    }
  }

  Future<bool> signIn() async {
    try {
      bool? response = await AccountSignInUseCase().call(AccountSignInUseCaseParams(username: username, password: password));
      return response;
    } catch(e) {
      WTWLogger.write('RegistrationController.signIn() error: $e');
      return false;
    }
  }

  Future<bool> signUp() async {
    try {
      bool? response = await AccountSignUpUseCase().call(AccountSignUpUseCaseParams(username: username, password: password));
      return response;
    } catch(e) {
      WTWLogger.write('RegistrationController.signUp() error: $e');
      return false;
    }
  }

  Future<void> start() async {
    await Get.find<WTWApplicationStarterService>().registerApplicationStarters();
    await navigateOff(route: '/dashboard', arguments: {});
  }

}