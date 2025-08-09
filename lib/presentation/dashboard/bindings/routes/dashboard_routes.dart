import 'package:wtoolboxweb/router/wtw_routes.dart';
import '../../view/account/account_view.dart';
import '../../view/dashboard/dashboard_view.dart';
import '../../view/settings/settings_view.dart';

class DashboardRoutes extends WTWRoutes {

  DashboardRoutes() {
    registerRoute(name: '/dashboard', view: () => DashboardView());
    registerRoute(name: '/account',   view: () => AccountView());
    registerRoute(name: '/settings',  view: () => SettingsView());
  }

}