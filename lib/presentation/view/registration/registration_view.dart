import 'package:flutter/material.dart';
import '../../../../core/3rd_party/lib_getx.dart';
import '../../../../core/view/wtoolbox_view.dart';
import '../../../../core/service/component_factory/variant/impl1/wtoolbox_component_variant.dart';
import '../../controller/registration/registration_controller.dart';

// ignore: must_be_immutable
class RegistrationView extends WTView<RegistrationController> {

  RegistrationView({ super.key }) {
    setController(RegistrationController());
  }

  Widget? createScaffold(RegistrationController? con) {
    var header = componentFactory!.createHeader(WTHeaderVariant.base1);

    var body = componentFactory!.createBody(WTBodyVariant.base1)!
      ..addComponent(Text('Hello World!'));

    var scaffold = componentFactory!.createScaffold(WTScaffoldVariant.base1)!
      ..setHeader(header!.build())
      ..setBody(body.build());
    return scaffold.build();
  }

  @override
  Widget build(BuildContext context) {
    return createScaffold(controller)!;
    //return Obx(() => createScaffold(controller)!);
  }

}