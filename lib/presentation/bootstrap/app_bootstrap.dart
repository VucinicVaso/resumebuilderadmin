import 'package:wtoolbox/bootstrap/wtoolbox_bootstrap.dart';

class AppBootstrap extends WTBootstrap {

  @override
  Future<void> register() async {
    setName('ResumeBuilderAdmin');
    setSettings({});
    //subscribeObserver();
    //registerTranslations();
    //registerRoutes();
  }

  @override
  Future<void> unregister() async {
    unregisterTranslations();
    unregisterRoutes();
    unsubscribeObserver();
  }
  
}