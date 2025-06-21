import 'package:flutter/material.dart';
import '../../../../core/3rd_party/lib_getx.dart';
import '../../../../core/view/wtoolbox_view.dart';
import '../../../../core/service/component_factory/variant/impl1/wtoolbox_component_variant.dart';
import '../../controller/dashboard/dashboard_controller.dart';

// ignore: must_be_immutable
class DashboardView extends WTView<DashboardController> {

  DashboardView({ super.key }) {
    setController(DashboardController());
  }

  Widget? createScaffold(DashboardController? con) {
    var header = componentFactory!.createHeader(WTHeaderVariant.base1);

    var body = componentFactory!.createBody(WTBodyVariant.base1)!
      ..addComponent(Text('Hello World! DashboardView'));

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