import 'package:resumebuilderadmin/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/wtoolbox/application_starter/wt_application_starter.dart';
import '../notifier/dashboard_notifier.dart';
import '../translation/dashboard_translations.dart';
import '../routes/dashboard_routes.dart';
import '../account/account_service.dart';
import '../account/impl/account_service_impl.dart';

class DashboardStarter extends WTApplicationStarter {

  @override
  Future<void> register() async {
    setTitle('ResumeBuilderAdmin');
    setSettings({});
    subscribeNotifier(DashboardNotifier());
    registerTranslations(DashboardTranslations());
    registerRoutes(DashboardRoutes());

    Get.put<AccountService>(AccountServiceImpl(), permanent: true);
  }

  @override
  Future<void> unregister() async {
    unregisterTranslations();
    unregisterRoutes();
    unsubscribeNotifier();

    Get.delete<AccountService>(force: true);
  }
  
}