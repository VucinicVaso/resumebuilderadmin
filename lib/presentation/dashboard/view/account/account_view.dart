import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/external/lib_material_symbols.dart';
import 'package:wtoolboxweb/clean_architecture/view/wtw_view.dart';
import 'package:wtoolboxweb/ui_factory/component/wtw_ui_component.dart';
import 'package:wtoolboxweb/ui_factory/type/impl/wtw_ui_component_type.dart';
import '../../controller/account/account_controller.dart';

// ignore: must_be_immutable
class AccountView extends WTWView<AccountController> {

  AccountView({ super.key }) {
    setController(AccountController());
  }

  WTWUIComponent? createBody(AccountController? con) {
    var firstnameField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con!.firstnameController)
      ..validationOnUserInteraction()
      ..setValidator(con.firstnameValidator)
      ..required()
      ..setLabel('firstname'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var lastnameField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.lastnameController)
      ..validationOnUserInteraction()
      ..setValidator(con.lastnameValidator)
      ..required()
      ..setLabel('lastname'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var imageField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.imageController)
      ..validationOnUserInteraction()
      ..setValidator(con.imageValidator)
      ..required()
      ..setLabel('image'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var dateOfBirthField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.datetime)!
      ..setController(con.dateOfBirthController)
      ..validationOnUserInteraction()
      ..setValidator(con.dateOfBirthValidator)
      ..required()
      ..setLabel('dateOfBirth'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var cityField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.cityController)
      ..validationOnUserInteraction()
      ..setValidator(con.cityValidator)
      ..required()
      ..setLabel('city'.tr)
      ..setPrefix(iconData: Symbols.account_circle);

    var countryField = uiFactory!.createFormInputFiled(WTWUIFormInputFieldType.text)!
      ..setController(con.countryController)
      ..validationOnUserInteraction()
      ..setValidator(con.countryValidator)
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

    var updateButton = uiFactory!.createButton(WTWUIButtonType.text1)!
      ..setAction(() async => con.submit())
      ..setLabel('save'.tr);

    var formLayout = uiFactory!.createLayout(WTWUILayoutType.vertical)!
      ..setMainAxisAlignment(MainAxisAlignment.center)
      ..setCrossAxisAlignment(CrossAxisAlignment.center)
      ..md()
      ..addComponent(form)
      ..addComponent(uiFactory!.createSpace(WTWUISpaceType.horizontal10))
      ..addComponent(updateButton);

    var layout = uiFactory!.createLayout(WTWUILayoutType.verticalExpanded)!
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