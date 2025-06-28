import 'package:resumebuilderadmin/core/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/mvc/controller/wtoolbox_controller.dart';

class RegistrationController extends WTController<RegistrationController> {

  RegistrationController() {
    init(arguments: Get.arguments);
    initState();
  }

  @override
  Future<void> initState() async {}

  @override
  Future<void> clearState() async {}

  var view = 0.obs;
  void setView(int? v) { view.value = v!; }

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

}