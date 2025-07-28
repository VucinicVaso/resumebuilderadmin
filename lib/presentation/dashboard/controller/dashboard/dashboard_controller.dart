import 'package:resumebuilderadmin/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/wtoolbox/clean_architecture/controller/wt_controller.dart';
import 'package:resumebuilderadmin/wtoolbox/application_starter/wt_application_starter_service.dart';
import 'package:resumebuilderadmin/presentation/dashboard/bindings/account/account_service.dart';

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
    await Get.find<AccountService>().logout();
    await Get.find<WTApplicationStarterService>().unregisterApplicationStarters();
    await navigateOff(route: '/');
  }

}