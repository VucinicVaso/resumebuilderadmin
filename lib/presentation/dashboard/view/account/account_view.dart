import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/wtoolbox/external/lib_material_symbols.dart';
import 'package:resumebuilderadmin/core/wtoolbox/clean_architecture/view/wt_view.dart';
import 'package:resumebuilderadmin/core/wtoolbox/component_factory/component/wt_component.dart';
import 'package:resumebuilderadmin/core/wtoolbox/component_factory/type/impl1/wt_component_type.dart';
import '../../controller/account/account_controller.dart';

// ignore: must_be_immutable
class AccountView extends WTView<AccountController> {

  AccountView({ super.key }) {
    setController(AccountController());
  }

  WTComponent? createScaffold(AccountController? con) {
    var header = componentFactory!.createHeader(WTHeaderType.basic1)!
      ..setBackAction(
        action: () async { await con!.navigateBack(); }, 
        icon: Symbols.arrow_back,
        label: 'account'.tr
      );

    var body = componentFactory!.createBody(WTBodyType.basic1);

    var scaffold = componentFactory!.createScaffold(WTScaffoldType.basic1)!
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