import '../../external/lib_getx.dart';
import '../../external/lib_dotenv.dart';
import '../../encryption/wt_encryption.dart';
import '../../encryption/impl/wt_encryption_impl.dart';
import '../../message_broker/wt_message_broker_service.dart';
import '../../message_broker/impl/wt_message_broker_service_impl.dart';
import '../../application_starter/wt_application_starter_service.dart';
import '../../application_starter/impl/wt_application_starter_service_impl.dart';
import '../../router/wt_router.dart';
import '../../router/impl/wt_router_impl.dart';
import '../../translation/wt_translation.dart';
import '../../translation/impl/wt_translation_impl.dart';
import '../../http_adapter/wt_http_adapter.dart';
import '../../http_adapter/impl/wt_http_adapter_impl.dart';
import '../../theme/wt_theme_service.dart';
import '../../theme/impl/wt_theme_service_impl.dart';
import '../../component_factory/factory/wt_component_factory.dart';
import '../../component_factory/factory/impl/wt_component_factory_service_impl.dart';
import '../../file_manager/wt_file_manager.dart';
import '../../file_manager/impl/wt_file_manager_impl.dart';
import '../wt_dependency_container.dart';

class WTDependencyContainerImpl extends WTDependencyContainer {

  @override
  Future<void> register({ String? dotenvFile }) async {
    await dotenv.load(fileName: dotenvFile!);

    Get.put<WTTranslation>(WTTranslationImpl());
    Get.put<WTThemeService>(WTThemeServiceImpl());
    Get.put<WTApplicationStarterService>(WTApplicationStarterServiceImpl());
    Get.put<WTRouter>(WTRouterImpl());
    Get.put<WTMessageBrokerService>(WTMessageBrokerServiceImpl());
    Get.put<WTEncryption>(WTEncryptionImpl(key: dotenv.get('ENCRYPTION_KEY')));
    Get.put<WTHttpAdapter>(WTHttpAdapterImpl());
    Get.put<WTFileManager>(WTFileManagerImpl());

    WTComponentFactory? componentFactory = WTComponentFactoryImpl()
      ..setTheme(Get.find<WTThemeService>().themeExtension!);
    Get.put<WTComponentFactory>(componentFactory);
  }

  @override
  Future<void> unregister() async {
    await Get.delete<WTEncryption>(force: true);
    await Get.delete<WTMessageBrokerService>(force: true);
    await Get.delete<WTTranslation>(force: true);
    await Get.delete<WTThemeService>(force: true);
    await Get.delete<WTRouter>(force: true);
    await Get.delete<WTApplicationStarterService>(force: true);
    await Get.delete<WTComponentFactory>(force: true);
    await Get.delete<WTHttpAdapter>(force: true);
    await Get.delete<WTFileManager>(force: true);  
    dotenv.clean();
  }

}

WTDependencyContainer? dependecyContainer = WTDependencyContainerImpl();