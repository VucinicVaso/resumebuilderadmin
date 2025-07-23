import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/external/lib_material_symbols.dart';
import 'package:resumebuilderadmin/core/clean_architecture/view/wtoolbox_view.dart';
import 'package:resumebuilderadmin/core/component_factory/component/wt_component.dart';
import 'package:resumebuilderadmin/core/component_factory/type/impl1/wtoolbox_component_type.dart';
import '../../controller/registration/registration_controller.dart';

// ignore: must_be_immutable
class RegistrationView extends WTView<RegistrationController> {

  RegistrationView({ super.key }) {
    setController(RegistrationController());
  }

  WTComponent? createFormView(RegistrationController? con) {
    var usernameField = componentFactory!.createFormInputFiled(WTFormInputFieldType.text)!
      ..setController(con!.usernameController)
      ..validationOnUserInteraction()
      ..setValidator(con.usernameValidator)
      ..setLabel('username'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var passwordField = componentFactory!.createFormInputFiled(WTFormInputFieldType.text)!
      ..setController(con.passwordController)
      ..validationOnUserInteraction()
      ..setValidator(con.passwordValidator)
      ..setLabel('password'.tr)
      ..setPrefix(iconData: Symbols.password);

    var form = componentFactory!.createForm(WTFormType.basic)!
      ..setFormKey(con.formKey)
      //..validationOnUserInteraction()
      ..addField(key: 'username'.tr, order: 0, inputField: usernameField)
      ..addField(key: 'password'.tr, order: 1, inputField: passwordField);

    var signInButton = componentFactory!.createButton(WTButtonType.text1)!
      ..setAction(() async => con.signIn())
      ..setLabel('signIn'.tr);
    var signUpButton = componentFactory!.createButton(WTButtonType.underlineText1)!
      ..setAction(() async => con.signUp())
      ..setLabel('signUp'.tr);
    var buttonLayout = componentFactory!.createLayout(WTLayoutType.horizontal)!
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..setMainAxisAlignment(MainAxisAlignment.spaceAround)
      ..addComponent(signInButton)
      ..addComponent(signUpButton);

    var formLayout = componentFactory!.createLayout(WTLayoutType.vertical)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..md()
      ..addComponent(form)
      ..addComponent(componentFactory!.createSpace(WTSpaceType.horizontal10))
      ..addComponent(buttonLayout);

    var layout = componentFactory!.createLayout(WTLayoutType.verticalExpanded)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..addComponent(formLayout);
    return layout;
  }

  WTComponent? createScaffold(RegistrationController? con) {
    var header = componentFactory!.createHeader(WTHeaderType.basic1)!;

    var body = componentFactory!.createBody(WTBodyType.basic1)!
      ..addComponent(createFormView(con));

    var scaffold = componentFactory!.createScaffold(WTScaffoldType.basic1)!
      ..setHeader(header)
      ..setBody(body);
    return scaffold;
  }

  @override
  Widget build(BuildContext context) {
    return createScaffold(controller)!.build()!;
    //return Obx(() => createScaffold(controller)!);
  }

}