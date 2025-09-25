import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/external/lib_material_symbols.dart';
import 'package:wtoolboxweb/base/view/wtw_view.dart';
import 'package:wtoolboxweb/ui_factory/component/wtw_ui_component.dart';
import 'package:wtoolboxweb/ui_factory/type/impl/wtw_ui_component_type.dart';
import '../../../controller/portfolio/show/portfolio_show_controller.dart';

// ignore: must_be_immutable
class PortfolioShowView extends WTWView<PortfolioShowController> {

  PortfolioShowView({ super.key }) {
    setController(PortfolioShowController());
  }

  WTWUIComponent? createEntityBody(PortfolioShowController? con) {
    var layout = uiFactory!.createLayout(WTWUILayoutType.verticalExpanded)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center);
    return layout;
  }

  WTWUIComponent? createListBody(PortfolioShowController? con) {
    var layout = uiFactory!.createLayout(WTWUILayoutType.verticalExpanded)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center);
    return layout;
  }

  WTWUIComponent? createBody(PortfolioShowController? con) {
    if(con!.entity.value!.key != 0) { return createEntityBody(con); }
    if(con.list.isNotEmpty) { return createListBody(con); }

    WTWUIComponent? widget = uiFactory!.createEmpty(WTWUIEmptyType.empty);

    var layout = uiFactory!.createLayout(WTWUILayoutType.verticalExpanded)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..addComponent(widget);
    return layout;
  }

  WTWUIComponent? createScaffold(PortfolioShowController? con) {
    var header = uiFactory!.createHeader(WTWUIHeaderType.basic1)!
      ..setBackAction(
        action: () async { await con!.navigateBack(); }, 
        icon: Symbols.arrow_back,
        label: 'portfolio'.tr
      );

    var body = uiFactory!.createBody(WTWUIBodyType.basic1)!
      ..addComponent(createBody(con));

    var scaffold = uiFactory!.createScaffold(WTWUIScaffoldType.basic1)!
      ..setHeader(header)
      ..setBody(body);
    return scaffold;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => createScaffold(controller)!.build()!);
  }

}