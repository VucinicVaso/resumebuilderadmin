import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/external/lib_material_symbols.dart';
import 'package:wtoolboxweb/clean_architecture/view/wtw_view.dart';
import 'package:wtoolboxweb/ui_factory/component/wtw_ui_component.dart';
import 'package:wtoolboxweb/ui_factory/type/impl/wtw_ui_component_type.dart';
import '../../../controller/skill/show/skill_show_controller.dart';

// ignore: must_be_immutable
class SkillShowView extends WTWView<SkillShowController> {

  SkillShowView({ super.key }) {
    setController(SkillShowController());
  }

  WTWUIComponent? createScaffold(SkillShowController? con) {
    var header = uiFactory!.createHeader(WTWUIHeaderType.basic1)!
      ..setBackAction(
        action: () async { await con!.navigateBack(); }, 
        icon: Symbols.arrow_back,
        label: 'skill'.tr
      );

    var body = uiFactory!.createBody(WTWUIBodyType.basic1);

    var scaffold = uiFactory!.createScaffold(WTWUIScaffoldType.basic1)!
      ..setHeader(header)
      ..setBody(body);
    return scaffold;
  }

  @override
  Widget build(BuildContext context) {
    return createScaffold(controller)!.build()!;
    //return Obx(() => createScaffold(controller)!);
  }

}