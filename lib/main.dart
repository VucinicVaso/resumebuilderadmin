import 'package:flutter/material.dart';
import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/wtoolboxweb_impl.dart';
import 'package:wtoolboxweb/router/wtw_router.dart';
import 'package:wtoolboxweb/theme/wtw_theme_service.dart';
import 'package:wtoolboxweb/translation/wtw_translation.dart';
import 'package:resumebuilderadmin/presentation/intro/bindings/application_starter/intro_starter.dart';
import 'package:resumebuilderadmin/presentation/dashboard/bindings/application_starter/dashboard_starter.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await wtoolboxweb.open(envFile: 'assets/.env');
  await wtoolboxweb.registerApplicationStarters(
    initialStarter: IntroStarter(),
    starters: [
      DashboardStarter()
    ]
  );
  wtoolboxweb.registerRoutes(
    initialRoute:  '/',
    redirectRoute: '/dashboard',
    logoutRoute:   '/'
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title:          'Resume Builder Admin',
      locale:         Get.find<WTWTranslation>().locale!,
      fallbackLocale: Get.find<WTWTranslation>().fallbackLocale!,
      translations:   Get.find<WTWTranslation>(),
      initialRoute:   Get.find<WTWRouter>().getInitialRoute(),
      getPages:       Get.find<WTWRouter>().getRoutes(),
      theme:          Get.find<WTWThemeService>().getTheme()!.themeData!,
      darkTheme:      Get.find<WTWThemeService>().getDarkTheme()!.themeData!,
    )
  );

}