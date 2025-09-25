import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/external/lib_material_symbols.dart';
import 'package:wtoolboxweb/base/view/wtw_view.dart';
import 'package:wtoolboxweb/ui_factory/component/wtw_ui_component.dart';
import 'package:wtoolboxweb/ui_factory/type/impl/wtw_ui_component_type.dart';
import '../../../controller/education/form/education_form_controller.dart';
import '../../../controller/education/form/education_form_validator.dart';

// ignore: must_be_immutable
class EducationFormView extends WTWView<EducationFormController> {

  EducationFormView({ super.key }) {
    setController(EducationFormController());
  }
  
  WTWUIComponent? createBody(EducationFormController? con) {
    var titleField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con!.titleController)
      ..validationOnUserInteraction()
      ..setValidator(EducationFormValidator.titleValidator)
      ..required()
      ..setLabel('title'.tr)
      ..setPrefix(iconData: Symbols.title);
    
    var linkField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.linkController)
      ..validationOnUserInteraction()
      ..setValidator(EducationFormValidator.linkValidator)
      ..required()
      ..setLabel('link'.tr)
      ..setPrefix(iconData: Symbols.link);

    var descriptionField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.descriptionController)
      ..validationOnUserInteraction()
      ..setValidator(EducationFormValidator.descriptionValidator)
      ..required()
      ..setLabel('description'.tr)
      ..setPrefix(iconData: Symbols.inbox_text);

    var dateTimeField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.datetime)!
      ..setController(con.dateTimeController)
      ..validationOnUserInteraction()
      ..setValidator(EducationFormValidator.dateTimeValidator)
      ..required()
      ..setLabel('dateTime'.tr)
      ..setPrefix(iconData: Symbols.calendar_month);

    var form = uiFactory!.createForm(WTWUIFormType.basic)!
      ..setFormKey(con.formKey)
      ..validationOnUserInteraction()
      ..addField(key: 'title'.tr,       order: 0, inputField: titleField)
      ..addField(key: 'link'.tr,        order: 1, inputField: linkField)
      ..addField(key: 'description'.tr, order: 3, inputField: descriptionField)
      ..addField(key: 'dateTime'.tr,    order: 4, inputField: dateTimeField);

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

  WTWUIComponent? createScaffold(EducationFormController? con) {
    var header = uiFactory!.createHeader(WTWUIHeaderType.basic1)!
      ..setBackAction(
        action: () async { await con!.navigateBack(); }, 
        icon: Symbols.arrow_back,
        label: 'education'.tr
      )
      ..addAction(
        action: () async { await con!.submit(); },
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
    return createScaffold(controller)!.build()!;
    //return Obx(() => createScaffold(controller)!);
  }

}