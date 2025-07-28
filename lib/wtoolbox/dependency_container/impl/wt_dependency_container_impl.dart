import 'package:resumebuilderadmin/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/wtoolbox/external/lib_dotenv.dart';
import 'package:resumebuilderadmin/wtoolbox/encryption/wt_encryption.dart';
import 'package:resumebuilderadmin/wtoolbox/encryption/impl/wt_encryption_impl.dart';
import 'package:resumebuilderadmin/wtoolbox/notifier/wt_notifier_service.dart';
import 'package:resumebuilderadmin/wtoolbox/notifier/impl/wt_notifier_service_impl.dart';
import 'package:resumebuilderadmin/wtoolbox/application_starter/wt_application_starter_service.dart';
import 'package:resumebuilderadmin/wtoolbox/application_starter/impl/wtoolbox_application_starter_service_impl.dart';
import 'package:resumebuilderadmin/wtoolbox/router/wt_router.dart';
import 'package:resumebuilderadmin/wtoolbox/router/impl/wt_router_impl.dart';
import 'package:resumebuilderadmin/wtoolbox/translation/wt_translation.dart';
import 'package:resumebuilderadmin/wtoolbox/translation/impl/wt_translation_impl.dart';
import 'package:resumebuilderadmin/wtoolbox/http_adapter/wt_http_adapter.dart';
import 'package:resumebuilderadmin/wtoolbox/http_adapter/impl/wt_http_adapter_impl.dart';
import 'package:resumebuilderadmin/wtoolbox/theme/wt_theme_service.dart';
import 'package:resumebuilderadmin/wtoolbox/theme/impl/wt_theme_service_impl.dart';
import 'package:resumebuilderadmin/wtoolbox/component_factory/factory/wt_component_factory.dart';
import 'package:resumebuilderadmin/wtoolbox/component_factory/factory/impl/wt_component_factory_service_impl.dart';
import 'package:resumebuilderadmin/wtoolbox/file_manager/wt_file_manager.dart';
import 'package:resumebuilderadmin/wtoolbox/file_manager/impl/wt_file_manager_impl.dart';
import '../wt_dependency_container.dart';

class WTDependencyContainerImpl extends WTDependencyContainer {

  @override
  Future<void> register({ String? dotenvFile }) async {
    await dotenv.load(fileName: dotenvFile!);

    Get.put<WTTranslation>(WTTranslationImpl());
    Get.put<WTThemeService>(WTThemeServiceImpl());
    Get.put<WTApplicationStarterService>(WTApplicationStarterServiceImpl());
    Get.put<WTRouter>(WTRouterImpl());
    Get.put<WTNotifierService>(WTNotifierServiceImpl());
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
    await Get.delete<WTNotifierService>(force: true);
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