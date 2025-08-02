import '../external/lib_getx.dart';
import '../message_broker/wt_message_broker.dart';
import '../message_broker/wt_message_broker_service.dart';
import '../router/wt_routes.dart';
import '../router/wt_router.dart';
import '../translation/wt_translations.dart';
import '../translation/wt_translation.dart';

abstract class WTApplicationStarter {

  /// application title
  String? _title = '';
  void setTitle(String? v) { _title = v; }
  String? getTitle() { return _title; }

  /// application settings (dotenv)
  Map<String, dynamic>? _settings = <String, dynamic>{};
  void setSettings(Map<String, dynamic>? v) { _settings = v; }
  Map<String, dynamic>? getSettings() { return _settings; }

  // register/unregister application translations
  WTTranslations? _translations;
  void registerTranslations(WTTranslations? translations) {
    _translations = translations;
    Get.find<WTTranslation>().setKeys(_translations!.keys);
  }
  void unregisterTranslations() {}

  // subscribe/unsubscribe application message broker
  WTMessageBroker? _broker;
  void subscribeMessageBroker(WTMessageBroker? broker) {
    _broker = broker;
    Get.find<WTMessageBrokerService>().subscribe(_broker);
  }
  void unsubscribeMessageBroker() {
    Get.find<WTMessageBrokerService>().unsubscribe(_broker!.getTitle());
  }

  // register/unregister application routes
  WTRoutes? _routes;
  void registerRoutes(WTRoutes? routes) {
    _routes = routes;
    Get.find<WTRouter>().registerRoutes(_routes!.getRoutes());
  }
  void unregisterRoutes() {
    Get.find<WTRouter>().unregisterRoutes(_routes!.getRoutes());
  }

  // register/unregister classes
  Future<void> register();
  Future<void> unregister();

}