import '../../3rd_party/lib_getx.dart';
import '../../3rd_party/lib_dotenv.dart';
import '../wtoolbox_dependency_injection.dart';
import '../../helper/encryption/wtoolbox_encryption.dart';
import '../../helper/encryption/impl/wtoolbox_encryption_impl.dart';
import '../../helper/device/wtoolbox_device.dart';
import '../../helper/device/impl/wtoolbox_device_impl.dart';
import '../../observable/wtoolbox_observable.dart';
import '../../observable/impl/wtoolbox_observable_impl.dart';
import '../../service/router_register/wtoolbox_router_register_service.dart';
import '../../service/router_register/impl/wtoolbox_router_register_service_impl.dart';
import '../../service/translation/wtoolbox_translation_service.dart';
import '../../service/translation/impl/wtoolbox_translation_service_impl.dart';
import '../../service/http/helper/wtoolbox_http_support.dart';
import '../../service/http/wtoolbox_http_service.dart';
import '../../service/http/impl/wtoolbox_http_service_impl.dart';
import '../../service/theme/wtoolbox_theme_service.dart';
import '../../service/theme/impl/wtoolbox_theme_service_impl.dart';
import '../../service/component_factory/factory/wtoolbox_component_factory_service.dart';
import '../../service/component_factory/factory/impl1/wtoolbox_component_factory_service_impl1.dart';

class WTDependencyInjectionImpl extends WTDependencyInjection {

  @override
  Future<void> register({ String? dotenvFileName }) async {
    // load .env file
    await dotenv.load(fileName: dotenvFileName!);

    var device = WTDeviceImpl();
    await device.getDeviceData();
    Get.put<WTDevice>(device);

    Get.put<WTEncryption>(WTEncryptionImpl());
    Get.put<WTTranslationService>(WTTranslationServiceImpl());
    Get.put<WTThemeService>(WTThemeServiceImpl());
    Get.put<WTObservable>(WTObservableImpl());
    Get.put<WTRouterRegisterService>(WTRouterRegisterServiceImpl());

    Get.put<WTHttpService>(WTHttpServiceImpl(dotenv.get('SSL_CERTIFICATE')));
    WTHttpSupport.instance.check();

    WTComponentFactoryService? cFsI1 = WTComponentFactoryServiceImpl1()
      ..setTheme(Get.find<WTThemeService>().themeExtensionService!);
    Get.put<WTComponentFactoryService>(cFsI1);
  }

  @override
  Future<void> unregister() async {
    await Get.delete<WTDevice>(force: true);
    await Get.delete<WTEncryption>(force: true);
    await Get.delete<WTObservable>(force: true);
    await Get.delete<WTTranslationService>(force: true);
    await Get.delete<WTThemeService>(force: true);
    await Get.delete<WTRouterRegisterService>(force: true);
    await Get.delete<WTComponentFactoryService>(force: true);
    await Get.delete<WTHttpService>(force: true);
    dotenv.clean();
  }

}

WTDependencyInjection? dependecyInjection = WTDependencyInjectionImpl();