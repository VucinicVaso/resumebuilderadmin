import 'package:resumebuilderadmin/core/router/wtoolbox_routes.dart';
import '../../view/registration/registration_view.dart';
import '../../view/dashboard/dashboard_view.dart';

class AppRoutes extends WTRoutes{

  AppRoutes() {
    registerRoute(name: '/',          view: () => RegistrationView());
    registerRoute(name: '/dashboard', view: () => DashboardView());
  }

}