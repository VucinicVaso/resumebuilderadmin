import 'package:resumebuilderadmin/core/application_starter/wtoolbox_application_starter.dart';
import '../notifier/app_notifier.dart';
import '../translation/app_translations.dart';
import '../routes/app_routes.dart';

class AppStarter extends WTApplicationStarter {

  @override
  Future<void> register() async {
    setTitle('ResumeBuilderAdmin');
    setSettings({});
    subscribeNotifier(AppNotifier());
    registerTranslations(AppTranslations());
    registerRoutes(AppRoutes());
  }

  @override
  Future<void> unregister() async {
    unregisterTranslations();
    unregisterRoutes();
    unsubscribeNotifier();
  }
  
}