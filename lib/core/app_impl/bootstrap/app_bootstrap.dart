import '../../bootstrap/wtoolbox_bootstrap.dart';
import '../observer/app_observer.dart';
import '../translation/app_translations.dart';
import '../router/app_router.dart';

class AppBootstrap extends WTBootstrap {

  @override
  Future<void> register() async {
    setName('ResumeBuilderAdmin');
    setSettings({});
    subscribeObserver(AppObserver());
    registerTranslations(AppTranslations());
    registerRoutes(AppRouting());
  }

  @override
  Future<void> unregister() async {
    unregisterTranslations();
    unregisterRoutes();
    unsubscribeObserver();
  }
  
}