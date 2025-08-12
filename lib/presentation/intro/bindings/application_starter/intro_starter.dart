import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/application_starter/wtw_application_starter.dart';
import '../../../../domain/repository/account/account_repository.dart';
import '../../../../data/repository/account/account_repository_hive.dart';
import '../message_broker/intro_message_broker.dart';
import '../translation/intro_translations.dart';
import '../routes/intro_routes.dart';

class IntroStarter extends WTWApplicationStarter {

  @override
  Future<void> register() async {
    setTitle('ResumeBuilderAdminIntro');
    setSettings({});
    subscribeMessageBroker(IntroMessageBroker());
    registerTranslations(IntroTranslations());
    registerRoutes(IntroRoutes());

    Get.put<AccountRepository>(AccountRepositoryHive(), permanent: true);
  }

  @override
  Future<void> unregister() async {
    unregisterTranslations();
    unregisterRoutes();
    unsubscribeMessageBroker();

    await Get.delete<AccountRepository>(force: true);
  }

}