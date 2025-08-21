import 'package:wtoolboxweb/router/wtw_routes.dart';
import '../../view/account/account_view.dart';
import '../../view/dashboard/dashboard_view.dart';
import '../../view/settings/settings_view.dart';
import '../../view/education/create/education_create_view.dart';
import '../../view/education/edit/education_edit_view.dart';
import '../../view/education/show/education_show_view.dart';
import '../../view/experience/create/experience_create_view.dart';
import '../../view/experience/edit/experience_edit_view.dart';
import '../../view/experience/show/experience_show_view.dart';
import '../../view/portfolio/create/portfolio_create_view.dart';
import '../../view/portfolio/edit/portfolio_edit_view.dart';
import '../../view/portfolio/show/portfolio_show_view.dart';
import '../../view/skill/create/skill_create_view.dart';
import '../../view/skill/edit/skill_edit_view.dart';
import '../../view/skill/show/skill_show_view.dart';

class DashboardRoutes extends WTWRoutes {

  DashboardRoutes() {
    registerRoute(name: '/dashboard', view: () => DashboardView());
    registerRoute(name: '/account',   view: () => AccountView());
    registerRoute(name: '/settings',  view: () => SettingsView());
    registerRoute(name: '/education/create', view: () => EducationCreateView());
    registerRoute(name: '/education/edit',   view: () => EducationEditView());
    registerRoute(name: '/education',        view: () => EducationShowView());
    registerRoute(name: '/education/:key',   view: () => EducationShowView());
    registerRoute(name: '/experience/create', view: () => ExperienceCreateView());
    registerRoute(name: '/experience/edit',   view: () => ExperienceEditView());
    registerRoute(name: '/experience',        view: () => ExperienceShowView());
    registerRoute(name: '/experience/:key',   view: () => ExperienceShowView());
    registerRoute(name: '/portfolio/create', view: () => PortfolioCreateView());
    registerRoute(name: '/portfolio/edit',   view: () => PortfolioEditView());
    registerRoute(name: '/portfolio',        view: () => PortfolioShowView());
    registerRoute(name: '/portfolio/:key',   view: () => PortfolioShowView());
    registerRoute(name: '/skill/create', view: () => SkillCreateView());
    registerRoute(name: '/skill/edit',   view: () => SkillEditView());
    registerRoute(name: '/skill',        view: () => SkillShowView());
    registerRoute(name: '/skill/:key',   view: () => SkillShowView());
  }

}