import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/logger/wtoolbox_logger.dart';
import 'package:resumebuilderadmin/core/clean_architecture/controller/wtoolbox_controller.dart';

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
    if(v.isEmpty) { return 'settings_account_form3'.tr; }
    if(v.length < 12) { return 'settings_account_form4'.tr; }
    if(v.contains(' ')) { return 'settings_account_form5'.tr; }
    if(!v.contains('.')) { return 'settings_account_form6'.tr; }
    return null;
  }

  String? password;
  TextEditingController? passwordController = TextEditingController();
  void passwordListener() { password = usernameController!.text; }
  passwordValidator(String v) {
    if(v.isEmpty) { return 'settings_account_form3'.tr; }
    if(v.length < 12) { return 'settings_account_form4'.tr; }
    if(v.contains(' ')) { return 'settings_account_form5'.tr; }
    if(!v.contains('.')) { return 'settings_account_form6'.tr; }
    return null;
  }

  Future<void> submit() async {
    print('---------------------------------------');
    print('-- submit()');
    print('-- username: $username');
    print('-- password: $password');
    print('---------------------------------------');

    setFormSubmitting(true);
    final FormState? form = formKey!.currentState;
    final bool formValidated = form!.validate();

    if(!formValidated) {
      setFormSubmitting(false);
      WTLogger.write('errorMessage'.tr);
      formKey!.currentState!.reset();
    }
    
    if(formValidated) {
      setFormSubmitting(false);
      formKey!.currentState!.reset();
      await navigateBack();
    }
  }

}