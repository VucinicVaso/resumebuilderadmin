import 'package:resumebuilderadmin/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/wtoolbox/clean_architecture/controller/wt_controller.dart';

class DashboardController extends WTController<DashboardController> {

  DashboardController() {
    init(arguments: Get.arguments);
    initState();
  }

  @override
  Future<void> initState() async {}

  @override
  Future<void> clearState() async {}

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

  Future<void> logout() async {
    await navigateOff(route: '/');
  }

}