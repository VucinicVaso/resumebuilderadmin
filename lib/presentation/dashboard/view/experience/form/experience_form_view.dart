import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/external/lib_material_symbols.dart';
import 'package:wtoolboxweb/clean_architecture/view/wtw_view.dart';
import 'package:wtoolboxweb/ui_factory/component/wtw_ui_component.dart';
import 'package:wtoolboxweb/ui_factory/type/impl/wtw_ui_component_type.dart';
import '../../../controller/experience/form/experience_form_controller.dart';
import '../../../controller/experience/form/experience_form_validator.dart';

// ignore: must_be_immutable
class ExperienceFormView extends WTWView<ExperienceFormController> {

  ExperienceFormView({ super.key }) {
    setController(ExperienceFormController());
  }

  WTWUIComponent? createBody(ExperienceFormController? con) {
    var titleField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con!.titleController)
      ..validationOnUserInteraction()
      ..setValidator(ExperienceFormValidator.titleValidator)
      ..required()
      ..setLabel('title'.tr)
      ..setPrefix(iconData: Symbols.title);
    
    var linkField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.linkController)
      ..validationOnUserInteraction()
      ..setValidator(ExperienceFormValidator.linkValidator)
      ..required()
      ..setLabel('link'.tr)
      ..setPrefix(iconData: Symbols.link);

    var positionField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.positionController)
      ..validationOnUserInteraction()
      ..setValidator(ExperienceFormValidator.positionValidator)
      ..required()
      ..setLabel('position'.tr)
      ..setPrefix(iconData: Symbols.link);

    var descriptionField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.descriptionController)
      ..validationOnUserInteraction()
      ..setValidator(ExperienceFormValidator.descriptionValidator)
      ..required()
      ..setLabel('description'.tr)
      ..setPrefix(iconData: Symbols.inbox_text);

    var dateFromField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.datetime)!
      ..setController(con.dateFromController)
      ..validationOnUserInteraction()
      ..setValidator(ExperienceFormValidator.dateFromValidator)
      ..required()
      ..setLabel('dateFrom'.tr)
      ..setPrefix(iconData: Symbols.calendar_month);

    var dateToField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.datetime)!
      ..setController(con.dateToController)
      ..validationOnUserInteraction()
      ..setValidator(ExperienceFormValidator.dateToValidator)
      ..required()
      ..setLabel('dateTo'.tr)
      ..setPrefix(iconData: Symbols.calendar_month);

    var totalField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.totalTimeController)
      ..validationOnUserInteraction()
      ..setValidator(ExperienceFormValidator.totalTimeValidator)
      ..disable()
      ..setLabel('totalTime'.tr)
      ..setPrefix(iconData: Symbols.calendar_month);

    var form = uiFactory!.createForm(WTWUIFormType.basic)!
      ..setFormKey(con.formKey)
      ..validationOnUserInteraction()
      ..addField(key: 'title'.tr,       order: 0, inputField: titleField)
      ..addField(key: 'link'.tr,        order: 1, inputField: linkField)
      ..addField(key: 'position'.tr,    order: 2, inputField: positionField)
      ..addField(key: 'description'.tr, order: 3, inputField: descriptionField)
      ..addField(key: 'dateFrom'.tr,    order: 4, inputField: dateFromField)      
      ..addField(key: 'dateTo'.tr,      order: 5, inputField: dateToField)
      ..addField(key: 'totalTime'.tr,   order: 6, inputField: totalField);

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

  WTWUIComponent? createScaffold(ExperienceFormController? con) {
    var header = uiFactory!.createHeader(WTWUIHeaderType.basic1)!
      ..setBackAction(
        action: () async { await con!.navigateBack(); }, 
        icon: Symbols.arrow_back,
        label: 'experience'.tr,
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