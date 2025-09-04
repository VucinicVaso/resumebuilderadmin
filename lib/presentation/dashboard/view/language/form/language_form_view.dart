import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/external/lib_material_symbols.dart';
import 'package:wtoolboxweb/clean_architecture/view/wtw_view.dart';
import 'package:wtoolboxweb/ui_factory/component/wtw_ui_component.dart';
import 'package:wtoolboxweb/ui_factory/type/impl/wtw_ui_component_type.dart';
import '../../../controller/language/form/language_form_controller.dart';
import '../../../controller/language/form/language_form_validator.dart';

// ignore: must_be_immutable
class LanguageFormView extends WTWView<LanguageFormController> {

  LanguageFormView({ super.key }) {
    setController(LanguageFormController());
  }

  WTWUIComponent? createBody(LanguageFormController? con) {
    var titleField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con!.titleController)
      ..validationOnUserInteraction()
      ..setValidator(LanguageFormValidator.validateTitle)
      ..required()
      ..setLabel('title'.tr)
      ..setPrefix(iconData: Symbols.title);

    var levelField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.levelController)
      ..validationOnUserInteraction()
      ..setValidator(LanguageFormValidator.validateLevel)
      ..required()
      ..setLabel('level'.tr)
      ..setPrefix(iconData: Symbols.stairs);

    var form = uiFactory!.createForm(WTWUIFormType.basic)!
      ..setFormKey(con.formKey)
      ..validationOnUserInteraction()
      ..addField(key: 'title'.tr, order: 0, inputField: titleField)
      ..addField(key: 'level'.tr, order: 1, inputField: levelField);

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

  WTWUIComponent? createScaffold(LanguageFormController? con) {
    var header = uiFactory!.createHeader(WTWUIHeaderType.basic1)!
      ..setBackAction(
        action: () async { await con!.navigateBack(); }, 
        icon: Symbols.arrow_back,
        label: 'language'.tr
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
    return createScaffold(controller)!.build()!;
    //return Obx(() => createScaffold(controller)!);
  }

}