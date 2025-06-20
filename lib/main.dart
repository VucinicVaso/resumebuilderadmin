import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import 'package:wtoolbox/dependency_injection/impl/wtoolbox_dependency_injection_impl.dart';
import 'package:wtoolbox/service/router_register/wtoolbox_router_register_service.dart';
import 'package:wtoolbox/service/theme/wtoolbox_theme_service.dart';
import 'package:wtoolbox/service/translation/wtoolbox_translation_service.dart';
import 'package:resumebuilderadmin/presentation/bootstrap/app_bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await dependencyInjection!.register(dotenvFileName: 'assets/.env');
  await initRoutes();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title:          'ResumeBuilderAdmin',
      locale:         Get.find<WTTranslationService>().locale!,
      fallbackLocale: Get.find<WTTranslationService>().fallbackLocale!,
      translations:   Get.find<WTTranslationService>(),
      initialRoute:   Get.find<WTRouterRegisterService>().getInitialRoute(),
      getPages:       Get.find<WTRouterRegisterService>().getRoutes(),
      theme:          Get.find<WTThemeService>().themeData,
      darkTheme:      Get.find<WTThemeService>().themeData,
    )
  );
}

Future<void> initRoutes() async {
  var router = Get.find<WTRouterRegisterService>();
  router
    ..setInitialRoute('/')
    ..setRedirectRoute('/')
    ..setLogoutRoute('/');

  await AppBootstrap().register();
}