import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/external/lib_material_symbols.dart';
import 'package:resumebuilderadmin/core/clean_architecture/view/wtoolbox_view.dart';
import 'package:resumebuilderadmin/core/component_factory/type/impl1/wtoolbox_component_type.dart';
import '../../controller/registration/registration_controller.dart';

// ignore: must_be_immutable
class RegistrationView extends WTView<RegistrationController> {

  RegistrationView({ super.key }) {
    setController(RegistrationController());
  }

  Widget? createSignUpView(RegistrationController? con) {
    return Text('RegistrationView.createSignUpView \n Hello World! \n width: ${componentFactory!.deviceWidth}, height: ${componentFactory!.deviceHeight}');
  }

  Widget? createSignInView(RegistrationController? con) {
    var usernameField = componentFactory!.createFormInputFiled(WTFormInputFieldType.text)!
      ..setController(con!.usernameController)
      ..validationOnUserInteraction()
      ..setValidator(con.usernameValidator)
      ..setLabel('Username:')
      ..setPrefix(iconData: Symbols.account_circle);

    var passwordField = componentFactory!.createFormInputFiled(WTFormInputFieldType.text)!
      ..setController(con.passwordController)
      ..setLabel('Password:')
      ..validationOnUserInteraction()
      ..setValidator(con.passwordValidator)
      ..setPrefix(iconData: Symbols.password);

    var form = componentFactory!.createForm(WTFormType.basic)!
      ..setFormKey(con.formKey)
      //..validationOnUserInteraction()
      ..addField(key: 'username', order: 0, inputField: usernameField)
      ..addField(key: 'password', order: 1, inputField: passwordField);

    var formLayout = componentFactory!.createLayout(WTLayoutType.vertical)!
      ..setBackgroundColor(Colors.green)
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..md()
      ..addComponent(form.build());

    var layout = componentFactory!.createLayout(WTLayoutType.verticalExpanded)!
      ..setBackgroundColor(Colors.orange) //delete
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..addComponent(Text('RegistrationView.createSignInView \n Hello World! \n width: ${componentFactory!.deviceWidth}, height: ${componentFactory!.deviceHeight}'))
      ..addComponent(formLayout.build());
    return layout.build();
  }

  Widget? createScaffold(RegistrationController? con) {
    var header = componentFactory!.createHeader(WTHeaderType.basic1)!;

    var body = componentFactory!.createBody(WTBodyType.basic1)!
      ..addComponent(con!.view.value == 0 ? createSignInView(con)! : createSignUpView(con)!);

    var scaffold = componentFactory!.createScaffold(WTScaffoldType.basic1)!
      ..setHeader(header.build())
      ..setBody(body.build());
    return scaffold.build();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => createScaffold(controller)!);
  }

}