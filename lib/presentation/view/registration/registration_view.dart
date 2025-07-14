import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/external/lib_getx.dart';
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
    return Text('RegistrationView.createSignInView \n Hello World! \n width: ${componentFactory!.deviceWidth}, height: ${componentFactory!.deviceHeight}');
  }

  Widget? createScaffold(RegistrationController? con) {
    var header = componentFactory!.createHeader(WTHeaderType.basic1)!
      ..setBackAction(
        action: () {}, 
        icon: Icons.logout
      )
      ..addAction(
        action: () async { await con!.navigateOff(route: '/dashboard'); }, 
        label: 'Dashboard'
      );

    var body = componentFactory!.createBody(WTBodyType.basic1)!
      ..addComponent(con!.view.value == 0 ? createSignUpView(con)! : createSignInView(con)!);

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