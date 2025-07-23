import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/logger/wtoolbox_logger.dart';
import 'package:resumebuilderadmin/core/clean_architecture/controller/wtoolbox_controller.dart';
import 'package:resumebuilderadmin/domain/usecase/account_signin_usecase.dart';
import 'package:resumebuilderadmin/domain/usecase/account_signup_usecase.dart';

class RegistrationController extends WTController<RegistrationController> {

  RegistrationController() {
    init(arguments: Get.arguments);
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
    usernameController!.clear();
    usernameController!.removeListener(usernameListener);

    password = '';
    passwordController!.clear();
    passwordController!.removeListener(passwordListener);
  }

  var view = 0.obs;
  void setView(int? v) { view.value = v!; }

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

  GlobalKey<FormState>? formKey;
  void setFormKey() {
    formKey = GlobalKey<FormState>();
  }

  var formSubmitting = false.obs;
  void setFormSubmitting(bool? b) { formSubmitting.value = b!; }

  String? username;
  TextEditingController? usernameController = TextEditingController();
  void usernameListener() { username = usernameController!.text; }
  usernameValidator(String v) {
    if(v.isEmpty) { return 'usernameController_form1'.tr; }
    if(v.length < 12) { return 'usernameController_form2'.tr; }
    if(v.contains(' ')) { return 'usernameController_form3'.tr; }
    if(!v.contains('.')) { return 'usernameController_form4'.tr; }
    return null;
  }

  String? password;
  TextEditingController? passwordController = TextEditingController();
  void passwordListener() { password = passwordController!.text; }
  passwordValidator(String v) {
    if(v.isEmpty) { return 'passwordController_form1'.tr; }
    if(v.length < 12) { return 'passwordController_form2'.tr; }
    if(v.contains(' ')) { return 'passwordController_form3'.tr; }
    return null;
  }

  Future<void> signIn() async {
    setFormSubmitting(true);
    final FormState? form    = formKey!.currentState;
    final bool formValidated = form!.validate();

    if(!formValidated) {
      setFormSubmitting(false);
      WTLogger.write('errorMessage'.tr);
      formKey!.currentState!.reset();
    }
    
    if(formValidated) {
      setFormSubmitting(false);
      bool? result = await AccountSignInUseCase().call(AccountSignInUseCaseParams(username: username!, password: password!));
      formKey!.currentState!.reset();
      await navigateOff(route: '/dashboard', arguments: {});
    }
  }

  Future<void> signUp() async {
    setFormSubmitting(true);
    final FormState? form    = formKey!.currentState;
    final bool formValidated = form!.validate();

    if(!formValidated) {
      setFormSubmitting(false);
      WTLogger.write('errorMessage'.tr);
      formKey!.currentState!.reset();
    }
    
    if(formValidated) {
      setFormSubmitting(false);
      bool? result = await AccountSignUpUseCase().call(AccountSignUpUseCaseParams(username: username!, password: password!));
      formKey!.currentState!.reset();
      await navigateOff(route: '/dashboard', arguments: {});
    }
  }

}