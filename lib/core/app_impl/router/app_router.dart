import '../../service/router_register/wtoolbox_routing.dart';
import '../../../presentation/view/registration/registration_view.dart';
import '../../../presentation/view/dashboard/dashboard_view.dart';

class AppRouting extends WTRouting {

  AppRouting() {
    registerRoute(name: '/',          view: () => RegistrationView());
    registerRoute(name: '/dashboard', view: () => DashboardView());
  }

}