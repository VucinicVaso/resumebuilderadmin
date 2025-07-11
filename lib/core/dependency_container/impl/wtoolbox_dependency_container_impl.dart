import 'package:resumebuilderadmin/core/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/external/lib_dotenv.dart';
import 'package:resumebuilderadmin/core/encryption/wtoolbox_encryption.dart';
import 'package:resumebuilderadmin/core/encryption/impl/wtoolbox_encryption_impl.dart';
import 'package:resumebuilderadmin/core/notifier/wtoolbox_notifier_service.dart';
import 'package:resumebuilderadmin/core/notifier/impl/wtoolbox_notifier_service_impl.dart';
import 'package:resumebuilderadmin/core/application_starter/wtoolbox_application_starter_service.dart';
import 'package:resumebuilderadmin/core/application_starter/impl/wtoolbox_application_starter_service_impl.dart';
import 'package:resumebuilderadmin/core/router/wtoolbox_router.dart';
import 'package:resumebuilderadmin/core/router/impl/wtoolbox_router_impl.dart';
import 'package:resumebuilderadmin/core/translation/wtoolbox_translation.dart';
import 'package:resumebuilderadmin/core/translation/impl/wtoolbox_translation_impl.dart';
import 'package:resumebuilderadmin/core/http_adapter/wtoolbox_http_adapter.dart';
import 'package:resumebuilderadmin/core/http_adapter/impl/wtoolbox_http_adapter_impl.dart';
import 'package:resumebuilderadmin/core/theme/wtoolbox_theme_catalog.dart';
import 'package:resumebuilderadmin/core/theme/impl/wtoolbox_theme_service_impl.dart';
import 'package:resumebuilderadmin/core/component_factory/factory/wtoolbox_component_factory.dart';
import 'package:resumebuilderadmin/core/component_factory/factory/impl1/wtoolbox_component_factory_service_impl1.dart';
import '../wtoolbox_dependency_container.dart';

class WTDependencyContainerImpl extends WTDependencyContainer {

  @override
  Future<void> register({ String? dotenvFile }) async {
    await dotenv.load(fileName: dotenvFile!);

    Get.put<WTTranslation>(WTTranslationImpl());
    Get.put<WTThemeCatalog>(WTThemeCatalogImpl());
    Get.put<WTApplicationStarterService>(WTApplicationStarterServiceImpl());
    Get.put<WTRouter>(WTRouterImpl());
    Get.put<WTNotifierService>(WTNotifierServiceImpl());
    Get.put<WTEncryption>(WTEncryptionImpl());
    Get.put<WTHttpAdapter>(WTHttpAdapterImpl());

    WTComponentFactory? componentFactory1 = WTComponentFactoryImpl1()
      ..setTheme(Get.find<WTThemeCatalog>().themeExtension!);
    Get.put<WTComponentFactory>(componentFactory1);
  }

  @override
  Future<void> unregister() async {
    await Get.delete<WTEncryption>(force: true);
    await Get.delete<WTNotifierService>(force: true);
    await Get.delete<WTTranslation>(force: true);
    await Get.delete<WTThemeCatalog>(force: true);
    await Get.delete<WTRouter>(force: true);
    await Get.delete<WTApplicationStarterService>(force: true);
    await Get.delete<WTComponentFactory>(force: true);
    await Get.delete<WTHttpAdapter>(force: true);    
    dotenv.clean();
  }

}

WTDependencyContainer? dependecyContainer = WTDependencyContainerImpl();