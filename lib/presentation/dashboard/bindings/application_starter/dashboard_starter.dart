import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/application_starter/wtw_application_starter.dart';
import 'package:resumebuilderadmin/domain/repository/message/message_repository.dart';
import 'package:resumebuilderadmin/data/repository/message/message_repository_hive.dart';
import '../message_broker/dashboard_message_broker.dart';
import '../translation/dashboard_translations.dart';
import '../routes/dashboard_routes.dart';

class DashboardStarter extends WTWApplicationStarter {

  @override
  Future<void> register() async {
    setTitle('ResumeBuilderAdmin');
    setSettings({});
    subscribeMessageBroker(DashboardMessageBroker());
    registerTranslations(DashboardTranslations());
    registerRoutes(DashboardRoutes());

    Get.put<MessageRepository>(MessageRepositoryHive(), permanent: true);
  }

  @override
  Future<void> unregister() async {
    unregisterTranslations();
    unregisterRoutes();
    unsubscribeMessageBroker();

    await Get.delete<MessageRepository>(force: true);
  }
  
}