import 'package:resumebuilderadmin/wtoolbox/router/wt_routes.dart';
import '../../view/dashboard/dashboard_view.dart';

class DashboardRoutes extends WTRoutes{

  DashboardRoutes() {
    registerRoute(name: '/dashboard', view: () => DashboardView());
  }

}