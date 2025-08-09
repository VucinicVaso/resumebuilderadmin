import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/external/lib_material_symbols.dart';
import 'package:wtoolboxweb/clean_architecture/view/wtw_view.dart';
import 'package:wtoolboxweb/ui_factory/component/wtw_ui_component.dart';
import 'package:wtoolboxweb/ui_factory/type/impl/wtw_ui_component_type.dart';
import '../../controller/dashboard/dashboard_controller.dart';

// ignore: must_be_immutable
class DashboardView extends WTWView<DashboardController> {

  DashboardView({ super.key }) {
    setController(DashboardController());
  }

  WTWUIComponent? createScaffold(DashboardController? con) {
    var header = uiFactory!.createHeader(WTWUIHeaderType.basic1)!
      ..addAction(
        action: () async { await con!.logout(); }, 
        icon: Symbols.logout
      );

    var sidebar = uiFactory!.createSidebar(WTWUISidebarType.basic1)!
      ..addAction(
        action: () async { await con!.navigateTo(route: '/account', previousRoute: '/dashboard', arguments: {}); },
        icon: Symbols.account_circle_rounded, 
        label: 'account'.tr
      )
      ..addAction(
        action: () async { await con!.navigateTo(route: '/settings', previousRoute: '/dashboard', arguments: {}); },
        icon: Symbols.settings, 
        label: 'settings'.tr
      );

    var body = uiFactory!.createBody(WTWUIBodyType.basic1);

    var floatingMenu = uiFactory!.createFloatingMenu(WTWUIFloatingMenuType.basic1)!
      ..setAction(() { print('floatingMenu action.'); })
      ..setIcon(Symbols.menu);

    var scaffold = uiFactory!.createScaffold(WTWUIScaffoldType.basic1)!
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