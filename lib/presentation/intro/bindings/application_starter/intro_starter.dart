import 'package:resumebuilderadmin/wtoolbox/application_starter/wt_application_starter.dart';
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
  }

  @override
  Future<void> unregister() async {
    unregisterTranslations();
    unregisterRoutes();
    unsubscribeMessageBroker();
  }
  
}