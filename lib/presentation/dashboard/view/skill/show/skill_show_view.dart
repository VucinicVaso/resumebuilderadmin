import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/external/lib_material_symbols.dart';
import 'package:wtoolboxweb/base/view/wtw_view.dart';
import 'package:wtoolboxweb/ui_factory/component/wtw_ui_component.dart';
import 'package:wtoolboxweb/ui_factory/type/impl/wtw_ui_component_type.dart';
import '../../../controller/skill/show/skill_show_controller.dart';

// ignore: must_be_immutable
class SkillShowView extends WTWView<SkillShowController> {

  SkillShowView({ super.key }) {
    setController(SkillShowController());
  }

  WTWUIComponent? createEntityBody(SkillShowController? con) {
    var layout = uiFactory!.createLayout(WTWUILayoutType.verticalExpanded)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center);
    return layout;
  }

  WTWUIComponent? createListBody(SkillShowController? con) {
    var layout = uiFactory!.createLayout(WTWUILayoutType.verticalExpanded)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center);
    return layout;
  }

  WTWUIComponent? createBody(SkillShowController? con) {
    if(con!.entity.value!.key != 0) { return createEntityBody(con); }
    if(con.list.isNotEmpty) { return createListBody(con); }

    WTWUIComponent? widget = uiFactory!.createEmpty(WTWUIEmptyType.empty);

    var layout = uiFactory!.createLayout(WTWUILayoutType.verticalExpanded)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..addComponent(widget);
    return layout;
  }

  WTWUIComponent? createScaffold(SkillShowController? con) {
    var header = uiFactory!.createHeader(WTWUIHeaderType.basic1)!
      ..setBackAction(
        action: () async { await con!.navigateBack(); }, 
        icon: Symbols.arrow_back,
        label: 'skill'.tr
      )
      ..addAction(
        action: () async { await con!.navigateTo(route: '/skill/form', previousRoute: '/skill', arguments: {}); },
        icon: Symbols.create_new_folder
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