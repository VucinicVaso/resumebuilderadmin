import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/external/lib_material_symbols.dart';
import 'package:wtoolboxweb/clean_architecture/view/wtw_view.dart';
import 'package:wtoolboxweb/ui_factory/component/wtw_ui_component.dart';
import 'package:wtoolboxweb/ui_factory/type/impl/wtw_ui_component_type.dart';
import '../../controller/registration/registration_controller.dart';

// ignore: must_be_immutable
class RegistrationView extends WTWView<RegistrationController> {

  RegistrationView({ super.key }) {
    setController(RegistrationController());
  }

  WTWUIComponent? createFormView(RegistrationController? con) {
    var usernameField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con!.usernameController)
      ..validationOnUserInteraction()
      ..setValidator(con.usernameValidator)
      ..setLabel('username'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var passwordField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.passwordController)
      ..validationOnUserInteraction()
      ..setValidator(con.passwordValidator)
      ..setLabel('password'.tr)
      ..setPrefix(iconData: Symbols.password);

    var form = uiFactory!.createForm(WTWUIFormType.basic)!
      ..setFormKey(con.formKey)
      //..validationOnUserInteraction()
      ..addField(key: 'username'.tr, order: 0, inputField: usernameField)
      ..addField(key: 'password'.tr, order: 1, inputField: passwordField);

    var signInButton = uiFactory!.createButton(WTWUIButtonType.text1)!
      ..setAction(() async => con.signIn())
      ..setLabel('signIn'.tr);
    var signUpButton = uiFactory!.createButton(WTWUIButtonType.underlineText1)!
      ..setAction(() async => con.signUp())
      ..setLabel('signUp'.tr);
    var buttonLayout = uiFactory!.createLayout(WTWUILayoutType.horizontal)!
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..setMainAxisAlignment(MainAxisAlignment.spaceAround)
      ..addComponent(signInButton)
      ..addComponent(signUpButton);

    var formLayout = uiFactory!.createLayout(WTWUILayoutType.vertical)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..md()
      ..addComponent(form)
      ..addComponent(uiFactory!.createSpace(WTWUISpaceType.horizontal10))
      ..addComponent(buttonLayout);

    var layout = uiFactory!.createLayout(WTWUILayoutType.verticalExpanded)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..addComponent(formLayout);
    return layout;
  }

  WTWUIComponent? createScaffold(RegistrationController? con) {
    var header = uiFactory!.createHeader(WTWUIHeaderType.basic1)!;

    var body = uiFactory!.createBody(WTWUIBodyType.basic1)!
      ..addComponent(createFormView(con));

    var scaffold = uiFactory!.createScaffold(WTWUIScaffoldType.basic1)!
      ..setHeader(header)
      ..setBody(body);
    return scaffold;
  }

  @override
  Widget build(BuildContext context) {
    return createScaffold(controller)!.build()!;
  }

}