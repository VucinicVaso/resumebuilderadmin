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

  WTWUIComponent? createBody(DashboardController? con) {
    var accountActionCard = uiFactory!.createCard(WTWUICardType.action)!
      ..setAction(() async { await con!.navigateTo(route: '/account', previousRoute: '/dashboard', arguments: {}); })
      ..setIcon(Symbols.account_circle_rounded)
      ..setLabel('account'.tr);

    var settingsActionCard = uiFactory!.createCard(WTWUICardType.action)!
      ..setAction(() async { await con!.navigateTo(route: '/settings', previousRoute: '/dashboard', arguments: {}); })
      ..setIcon(Symbols.settings)
      ..setLabel('settings'.tr);

    var educationActionCard = uiFactory!.createCard(WTWUICardType.action)!
      ..setAction(() async { await con!.navigateTo(route: '/education', previousRoute: '/dashboard', arguments: {}); })
      ..setIcon(Symbols.folder_eye)
      ..setLabel('education'.tr);

    var experienceActionCard = uiFactory!.createCard(WTWUICardType.action)!
      ..setAction(() async { await con!.navigateTo(route: '/experience', previousRoute: '/dashboard', arguments: {}); })
      ..setIcon(Symbols.folder_eye)
      ..setLabel('experience'.tr);

    var skillActionCard = uiFactory!.createCard(WTWUICardType.action)!
      ..setAction(() async { await con!.navigateTo(route: '/skill', previousRoute: '/dashboard', arguments: {}); })
      ..setIcon(Symbols.folder_eye)
      ..setLabel('skill'.tr);

    var portfolioActionCard = uiFactory!.createCard(WTWUICardType.action)!
      ..setAction(() async { await con!.navigateTo(route: '/portfolio', previousRoute: '/dashboard', arguments: {}); })
      ..setIcon(Symbols.folder_eye)
      ..setLabel('portfolio'.tr);

    var cvActionCard = uiFactory!.createCard(WTWUICardType.action)!
      ..setAction(() async { await con!.navigateTo(route: '/cv', previousRoute: '/dashboard', arguments: {}); })
      ..setIcon(Symbols.folder_eye)
      ..setLabel('cv'.tr);

    var wrap = uiFactory!.createWrap(WTWUIWrapType.wrap)!
      ..setHorizontalDirection()
      ..addComponent(accountActionCard)
      ..addComponent(settingsActionCard)
      ..addComponent(educationActionCard)
      ..addComponent(experienceActionCard)
      ..addComponent(skillActionCard)
      ..addComponent(portfolioActionCard)
      ..addComponent(cvActionCard);
    
    var layout = uiFactory!.createLayout(WTWUILayoutType.verticalExpandedAndScrollable)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..addComponent(wrap);
    return layout;
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
        icon:   Symbols.account_circle_rounded, 
        label: 'account'.tr
      )
      ..addAction(
        action: () async { await con!.navigateTo(route: '/settings', previousRoute: '/dashboard', arguments: {}); },
        icon:   Symbols.settings, 
        label: 'settings'.tr
      )
      ..addMenuAction(
        icon: Symbols.article,
        label: 'education'.tr,
        items: [
          { 'icon': Symbols.create_new_folder, 'label': 'new'.tr,  'action': () async { await con!.navigateTo(route: '/education/form', previousRoute: '/dashboard', arguments: {}); } },
          { 'icon': Symbols.folder_eye,        'label': 'show'.tr, 'action': () async { await con!.navigateTo(route: '/education', previousRoute: '/dashboard', arguments: {}); } },
        ]
      )
      ..addMenuAction(
        icon: Symbols.article,
        label: 'experience'.tr,
        items: [
          { 'icon': Symbols.create_new_folder, 'label': 'new'.tr,  'action': () async { await con!.navigateTo(route: '/experience/form', previousRoute: '/dashboard', arguments: {}); } },
          { 'icon': Symbols.folder_eye,        'label': 'show'.tr, 'action': () async { await con!.navigateTo(route: '/experience', previousRoute: '/dashboard', arguments: {});  } },
        ]
      )
      ..addMenuAction(
        icon: Symbols.article,
        label: 'skill'.tr,
        items: [
          { 'icon': Symbols.create_new_folder, 'label': 'new'.tr,  'action': () async { await con!.navigateTo(route: '/skill/form', previousRoute: '/dashboard', arguments: {}); } },
          { 'icon': Symbols.folder_eye,        'label': 'show'.tr, 'action': () async { await con!.navigateTo(route: '/skill', previousRoute: '/dashboard', arguments: {}); } },
        ]
      )
      ..addMenuAction(
        icon: Symbols.article,
        label: 'portfolio'.tr,
        items: [
          { 'icon': Symbols.create_new_folder, 'label': 'new'.tr,  'action': () async { await con!.navigateTo(route: '/portfolio/form', previousRoute: '/dashboard', arguments: {}); } },
          { 'icon': Symbols.folder_eye,        'label': 'show'.tr, 'action': () async { await con!.navigateTo(route: '/portfolio', previousRoute: '/dashboard', arguments: {}); } },
        ]
      )
      ..addMenuAction(
        icon: Symbols.article,
        label: 'cv'.tr,
        items: [
          { 'icon': Symbols.create_new_folder, 'label': 'new'.tr,  'action': () async { await con!.navigateTo(route: '/cv/form', previousRoute: '/dashboard', arguments: {}); } },
          { 'icon': Symbols.folder_eye,        'label': 'show'.tr, 'action': () async { await con!.navigateTo(route: '/cv', previousRoute: '/dashboard', arguments: {}); } },
        ]
      );

    var body = uiFactory!.createBody(WTWUIBodyType.basic1)!
      ..addComponent(createBody(con)!);

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