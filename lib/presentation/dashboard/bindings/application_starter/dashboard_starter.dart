import 'package:resumebuilderadmin/wtoolbox/application_starter/wt_application_starter.dart';
import '../message_broker/dashboard_message_broker.dart';
import '../translation/dashboard_translations.dart';
import '../routes/dashboard_routes.dart';

class DashboardStarter extends WTApplicationStarter {

  @override
  Future<void> register() async {
    setTitle('ResumeBuilderAdmin');
    setSettings({});
    subscribeMessageBroker(DashboardMessageBroker());
    registerTranslations(DashboardTranslations());
    registerRoutes(DashboardRoutes());
  }

  @override
  Future<void> unregister() async {
    unregisterTranslations();
    unregisterRoutes();
    unsubscribeMessageBroker();
  }
  
}