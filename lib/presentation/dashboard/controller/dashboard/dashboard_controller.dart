import 'package:resumebuilderadmin/core/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/wtoolbox/clean_architecture/controller/wt_controller.dart';
import 'package:resumebuilderadmin/core/wtoolbox/application_starter/wt_application_starter_service.dart';
import 'package:resumebuilderadmin/domain/usecase/account_signout_usecase.dart';

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
    await AccountSignOutUseCase().call();
    await Get.find<WTApplicationStarterService>().unregisterApplicationStarters();
    await navigateOff(route: '/');
  }

}