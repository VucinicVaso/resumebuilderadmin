import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import 'package:wtoolboxweb/base/controller/wtw_controller.dart';
import 'package:wtoolboxweb/application_starter/wtw_application_starter_service.dart';
import '../../../../domain/usecase/account/account_signin_usecase.dart';
import '../../../../domain/usecase/account/account_signup_usecase.dart';

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

  String? password;
  TextEditingController? passwordController = TextEditingController();
  void passwordListener() { password = passwordController!.text; }

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