import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/wtoolbox/validator/wt_validator.dart';
import 'package:resumebuilderadmin/wtoolbox/logger/wt_logger.dart';
import 'package:resumebuilderadmin/wtoolbox/clean_architecture/controller/wt_controller.dart';
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
    String? error;
    error = WTValidator.isEmpty(key: 'username'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTValidator.containsEmptySpace(key: 'username'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTValidator.missingSign(key: 'username'.tr, value: v, sign: '.');
    if(error!.isNotEmpty) { return error; }
    error = WTValidator.minimumLength(key: 'username'.tr, value: v, length: 6);
    if(error!.isNotEmpty) { return error; }
    return null;
  }

  String? password;
  TextEditingController? passwordController = TextEditingController();
  void passwordListener() { password = passwordController!.text; }
  passwordValidator(String v) {
    String? error = '';
    error = WTValidator.isEmpty(key: 'password'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTValidator.containsEmptySpace(key: 'password'.tr, value: v);
    if(error!.isNotEmpty) { return error; }
    error = WTValidator.minimumLength(key: 'password'.tr, value: v, length: 12);
    if(error!.isNotEmpty) { return error; }
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