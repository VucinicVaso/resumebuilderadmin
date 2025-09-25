import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/external/lib_material_symbols.dart';
import 'package:wtoolboxweb/base/view/wtw_view.dart';
import 'package:wtoolboxweb/ui_factory/component/wtw_ui_component.dart';
import 'package:wtoolboxweb/ui_factory/type/impl/wtw_ui_component_type.dart';
import '../../controller/account/account_controller.dart';
import '../../controller/account/account_validator.dart';

// ignore: must_be_immutable
class AccountView extends WTWView<AccountController> {

  AccountView({ super.key }) {
    setController(AccountController());
  }

  WTWUIComponent? createBody(AccountController? con) {
    var firstnameField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con!.firstnameController)
      ..validationOnUserInteraction()
      ..setValidator(AccountValidator.firstnameValidator)
      ..required()
      ..setLabel('firstname'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var lastnameField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.lastnameController)
      ..validationOnUserInteraction()
      ..setValidator(AccountValidator.lastnameValidator)
      ..required()
      ..setLabel('lastname'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var imageField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.imageController)
      ..validationOnUserInteraction()
      ..setValidator(AccountValidator.imageValidator)
      ..required()
      ..setLabel('image'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var dateOfBirthField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.datetime)!
      ..setController(con.dateOfBirthController)
      ..validationOnUserInteraction()
      ..setValidator(AccountValidator.dateOfBirthValidator)
      ..required()
      ..setLabel('dateOfBirth'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var cityField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.cityController)
      ..validationOnUserInteraction()
      ..setValidator(AccountValidator.cityValidator)
      ..required()
      ..setLabel('city'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var countryField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.countryController)
      ..validationOnUserInteraction()
      ..setValidator(AccountValidator.countryValidator)
      ..required()
      ..setLabel('country'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var form = uiFactory!.createForm(WTWUIFormType.basic)!
      ..setFormKey(con.formKey)
      ..validationOnUserInteraction()
      ..addField(key: 'firstname'.tr,   order: 0, inputField: firstnameField)
      ..addField(key: 'lastname'.tr,    order: 1, inputField: lastnameField)
      ..addField(key: 'image'.tr,       order: 2, inputField: imageField)
      ..addField(key: 'dateOfBirth'.tr, order: 3, inputField: dateOfBirthField)      
      ..addField(key: 'city'.tr,        order: 4, inputField: cityField)
      ..addField(key: 'country'.tr,     order: 5, inputField: countryField);

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

  WTWUIComponent? createScaffold(AccountController? con) {
    var header = uiFactory!.createHeader(WTWUIHeaderType.basic1)!
      ..setBackAction(
        action: () async { await con!.navigateBack(); },
        icon: Symbols.arrow_back,
        label: 'account'.tr
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