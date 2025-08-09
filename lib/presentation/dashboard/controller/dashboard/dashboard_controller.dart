import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/application_starter/wtw_application_starter_service.dart';
import 'package:resumebuilderadmin/domain/usecase/account_signout_usecase.dart';

class DashboardController extends WTWController<DashboardController> {

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
    await AccountSignOutUseCase().call();
    await Get.find<WTWApplicationStarterService>().unregisterApplicationStarters();
    await navigateOff(route: '/');
  }

}