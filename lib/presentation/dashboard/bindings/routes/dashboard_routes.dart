import 'package:resumebuilderadmin/core/wtoolbox/router/wt_routes.dart';
import '../../view/account/account_view.dart';
import '../../view/dashboard/dashboard_view.dart';
import '../../view/settings/settings_view.dart';

class DashboardRoutes extends WTRoutes{

  DashboardRoutes() {
    registerRoute(name: '/dashboard', view: () => DashboardView());
    registerRoute(name: '/account',   view: () => AccountView());
    registerRoute(name: '/settings',  view: () => SettingsView());
  }

}