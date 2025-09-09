import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/external/lib_material_symbols.dart';
import 'package:wtoolboxweb/clean_architecture/view/wtw_view.dart';
import 'package:wtoolboxweb/ui_factory/component/wtw_ui_component.dart';
import 'package:wtoolboxweb/ui_factory/type/impl/wtw_ui_component_type.dart';
import '../../controller/settings/settings_controller.dart';

// ignore: must_be_immutable
class SettingsView extends WTWView<SettingsController> {

  SettingsView({ super.key }) {
    setController(SettingsController());
  }

  WTWUIComponent? createBody(SettingsController? con) {
    var languageField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.dropdown)!
      ..setController(con!.languageController)
      ..validationOnUserInteraction()
      ///..setValidator(SettingsValidator.validateLanguage)
      ..required()
      ..setLabel('language'.tr)
      ..setPrefix(iconData: Symbols.language)
      ..addDropdownItems(con.languages);

    var themeField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.dropdown)!
      ..setController(con.themeController)
      ..validationOnUserInteraction()
      ///..setValidator(SettingsValidator.validateTheme)
      ..required()
      ..setLabel('theme'.tr)
      ..setPrefix(iconData: Symbols.colors)
      ..addDropdownItems(con.themes);

    var form = uiFactory!.createForm(WTWUIFormType.basic)!
      ..setFormKey(con.formKey)
      ..validationOnUserInteraction()
      ..addField(key: 'language'.tr, order: 0, component: languageField)
      ..addField(key: 'theme'.tr,    order: 1, component: themeField);

    var formLayout = uiFactory!.createLayout(WTWUILayoutType.vertical)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..md()
      ..addComponent(form);

    var layout = uiFactory!.createLayout(WTWUILayoutType.verticalExpandedAndScrollable)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..addComponent(formLayout);
    return layout;
  }

  WTWUIComponent? createScaffold(SettingsController? con) {
    var header = uiFactory!.createHeader(WTWUIHeaderType.basic1)!
      ..setBackAction(
        action: () async { await con!.navigateBack(); }, 
        icon: Symbols.arrow_back,
        label: 'settings'.tr
      )
      ..addAction(
        action: () async => await con!.submit(),
        label: 'save'.tr   
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