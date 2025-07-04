import 'package:flutter/material.dart';
import 'core/external/lib_getx.dart';
import 'core/dependency_container/impl/wtoolbox_dependency_container_impl.dart';
import 'core/router/wtoolbox_router.dart';
import 'core/application_starter/wtoolbox_application_starter_service.dart';
import 'core/theme/wtoolbox_theme_catalog.dart';
import 'core/translation/wtoolbox_translation.dart';
import 'presentation/bindings/starter/app_starter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dependecyContainer!.register(dotenvFile: 'assets/.env');
  await initRoutes();
  await initApplications();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title:          'ResumeBuilderAdmin',
      locale:         Get.find<WTTranslation>().locale!,
      fallbackLocale: Get.find<WTTranslation>().fallbackLocale!,
      translations:   Get.find<WTTranslation>(),
      initialRoute:   Get.find<WTRouter>().getInitialRoute(),
      getPages:       Get.find<WTRouter>().getRoutes(),
      theme:          Get.find<WTThemeCatalog>().themeData,
      darkTheme:      Get.find<WTThemeCatalog>().themeData,
    )
  );
}

Future<void> initRoutes() async {
  var router = Get.find<WTRouter>();
  router
    ..setInitialRoute('/')
    ..setRedirectRoute('/')
    ..setLogoutRoute('/');
}

Future<void> initApplications() async {
  var applicationService = Get.find<WTApplicationStarterService>();
  applicationService.registerInitialApplicationStarter(AppStarter());
}