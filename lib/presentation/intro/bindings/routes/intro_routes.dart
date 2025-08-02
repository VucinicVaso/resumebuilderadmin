import 'package:resumebuilderadmin/core/wtoolbox/router/wt_routes.dart';
import '../../view/registration/registration_view.dart';

class IntroRoutes extends WTRoutes{

  IntroRoutes() {
    registerRoute(name: '/', view: () => RegistrationView());
  }

}