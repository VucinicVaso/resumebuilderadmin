import 'package:resumebuilderadmin/core/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/wtoolbox/application_starter/wt_application_starter.dart';
import 'package:resumebuilderadmin/domain/repository/account/account_repository.dart';
import 'package:resumebuilderadmin/data/repository/account/account_repository_hive.dart';
import '../message_broker/intro_message_broker.dart';
import '../translation/intro_translations.dart';
import '../routes/intro_routes.dart';

class IntroStarter extends WTApplicationStarter {

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