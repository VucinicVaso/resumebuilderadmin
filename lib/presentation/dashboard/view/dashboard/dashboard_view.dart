import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/wtoolbox/external/lib_material_symbols.dart';
import 'package:resumebuilderadmin/core/wtoolbox/clean_architecture/view/wt_view.dart';
import 'package:resumebuilderadmin/core/wtoolbox/component_factory/component/wt_component.dart';
import 'package:resumebuilderadmin/core/wtoolbox/component_factory/type/impl1/wt_component_type.dart';
import '../../controller/dashboard/dashboard_controller.dart';

// ignore: must_be_immutable
class DashboardView extends WTView<DashboardController> {

  DashboardView({ super.key }) {
    setController(DashboardController());
  }

  WTComponent? createScaffold(DashboardController? con) {
    var header = componentFactory!.createHeader(WTHeaderType.basic1)!
      ..withSidebar()
      ..addAction(
        action: () async { await con!.logout(); }, 
        icon: Symbols.logout
      );

    var sidebar = componentFactory!.createSidebar(WTSidebarType.basic1)!
      ..addAction(action: () { print('sidebar action Account.'); }, icon: Symbols.account_circle_rounded, label: 'account'.tr)
      ..addAction(action: () { print('sidebar action Settings.'); }, icon: Symbols.settings, label: 'settings'.tr);

    var body = componentFactory!.createBody(WTBodyType.basic1);

    var floatingMenu = componentFactory!.createFloatingMenu(WTFloatingMenuType.basic1)!
      ..setAction(() { print('floatingMenu action.'); })
      ..setIcon(Symbols.menu);

    var scaffold = componentFactory!.createScaffold(WTScaffoldType.basic1)!
      ..setHeader(header)
      ..setSidebar(sidebar)
      ..setBody(body)
      ..setFloatingMenu(floatingMenu);
    return scaffold;
  }

  @override
  Widget build(BuildContext context) {
    return createScaffold(controller)!.build()!;
    //return Obx(() => createScaffold(controller)!);
  }

}