import 'package:resumebuilderadmin/wtoolbox/application_starter/wt_application_starter.dart';
import '../notifier/intro_notifier.dart';
import '../translation/intro_translations.dart';
import '../routes/intro_routes.dart';

class IntroStarter extends WTApplicationStarter {

  @override
  Future<void> register() async {
    setTitle('ResumeBuilderAdminIntro');
    setSettings({});
    subscribeNotifier(IntroNotifier());
    registerTranslations(IntroTranslations());
    registerRoutes(IntroRoutes());
  }

  @override
  Future<void> unregister() async {
    unregisterTranslations();
    unregisterRoutes();
    unsubscribeNotifier();
  }
  
}