import 'package:flutter/material.dart';
import 'wtoolbox/external/lib_getx.dart';
import 'wtoolbox/dependency_container/impl/wt_dependency_container_impl.dart';
import 'wtoolbox/router/wt_router.dart';
import 'wtoolbox/application_starter/wt_application_starter_service.dart';
import 'wtoolbox/theme/wt_theme_service.dart';
import 'wtoolbox/translation/wt_translation.dart';
import 'package:resumebuilderadmin/presentation/intro/bindings/application_starter/intro_starter.dart';
import 'package:resumebuilderadmin/presentation/dashboard/bindings/application_starter/dashboard_starter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dependecyContainer!.register(dotenvFile: 'assets/.env');
  await initApplications();
  await initRoutes();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title:          'Resume Builder Admin',
      locale:         Get.find<WTTranslation>().locale!,
      fallbackLocale: Get.find<WTTranslation>().fallbackLocale!,
      translations:   Get.find<WTTranslation>(),
      initialRoute:   Get.find<WTRouter>().getInitialRoute(),
      getPages:       Get.find<WTRouter>().getRoutes(),
      theme:          Get.find<WTThemeService>().themeData,
      darkTheme:      Get.find<WTThemeService>().themeData,
    )
  );
}

Future<void> initApplications() async {
  var applicationService = Get.find<WTApplicationStarterService>();

  applicationService
    ..registerInitialApplicationStarter(IntroStarter())
    ..addApplicationStarter(DashboardStarter());
}

Future<void> initRoutes() async {
  var router = Get.find<WTRouter>();

  router
    ..setInitialRoute('/')
    ..setRedirectRoute('/dashboard')
    ..setLogoutRoute('/');
}