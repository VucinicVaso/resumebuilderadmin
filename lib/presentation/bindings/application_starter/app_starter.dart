import 'package:resumebuilderadmin/core/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/application_starter/wtoolbox_application_starter.dart';
import '../notifier/app_notifier.dart';
import '../translation/app_translations.dart';
import '../routes/app_routes.dart';
import '../account/account_service.dart';
import '../account/impl/account_service_impl.dart';

class AppStarter extends WTApplicationStarter {

  @override
  Future<void> register() async {
    setTitle('ResumeBuilderAdmin');
    setSettings({});
    subscribeNotifier(AppNotifier());
    registerTranslations(AppTranslations());
    registerRoutes(AppRoutes());

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