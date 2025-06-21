import '../../../../core/3rd_party/lib_getx.dart';
import '../../../../core/controller/wtoolbox_controller.dart';

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

}