import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/clean_architecture/view/wtoolbox_view.dart';
import 'package:resumebuilderadmin/core/component_factory/type/impl1/wtoolbox_component_type.dart';
import '../../controller/dashboard/dashboard_controller.dart';

// ignore: must_be_immutable
class DashboardView extends WTView<DashboardController> {

  DashboardView({ super.key }) {
    setController(DashboardController());
  }

  Widget? createScaffold(DashboardController? con) {
    var header = componentFactory!.createHeader(WTHeaderType.basic1)!
      ..setBackAction(
        action: () async { await con!.logout(); }, 
        icon: Icons.logout
      );

    var body = componentFactory!.createBody(WTBodyType.basic1);

    var scaffold = componentFactory!.createScaffold(WTScaffoldType.basic1)!
      ..setHeader(header.build())
      ..setBody(body!.build()!);
    return scaffold.build();
  }

  @override
  Widget build(BuildContext context) {
    return createScaffold(controller)!;
    //return Obx(() => createScaffold(controller)!);
  }

}