import 'package:resumebuilderadmin/core/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/wtoolbox/clean_architecture/controller/wt_controller.dart';

class SettingsController extends WTController<SettingsController> {

  SettingsController() {
    init(arguments: Get.arguments);
    initState();
  }

  @override
  Future<void> initState() async {}

  @override
  Future<void> clearState() async {}

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

}