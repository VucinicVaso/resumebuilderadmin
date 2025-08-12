import 'package:wtoolboxweb/router/wtw_routes.dart';
import '../../view/registration/registration_view.dart';

class IntroRoutes extends WTWRoutes {

  IntroRoutes() {
    registerRoute(name: '/', view: () => RegistrationView());
  }

}