import 'package:wtoolboxweb/router/wtw_routes.dart';
import '../../view/account/account_view.dart';
import '../../view/dashboard/dashboard_view.dart';
import '../../view/settings/settings_view.dart';
import '../../view/education/form/education_form_view.dart';
import '../../view/education/show/education_show_view.dart';
import '../../view/experience/form/experience_form_view.dart';
import '../../view/experience/show/experience_show_view.dart';
import '../../view/portfolio/form/portfolio_form_view.dart';
import '../../view/portfolio/show/portfolio_show_view.dart';
import '../../view/skill/form/skill_form_view.dart';
import '../../view/skill/show/skill_show_view.dart';
import '../../view/language/form/language_form_view.dart';
import '../../view/language/show/language_show_view.dart';
import '../../view/cv/form/cv_form_view.dart';
import '../../view/cv/show/cv_show_view.dart';

class DashboardRoutes extends WTWRoutes {

  DashboardRoutes() {
    registerRoute(name: '/dashboard',            view: () => DashboardView());
    registerRoute(name: '/account',              view: () => AccountView());
    registerRoute(name: '/settings',             view: () => SettingsView());
    registerRoute(name: '/education/form',       view: () => EducationFormView());
    registerRoute(name: '/education/form/:key',  view: () => EducationFormView());
    registerRoute(name: '/education',            view: () => EducationShowView());
    registerRoute(name: '/education/:key',       view: () => EducationShowView());
    registerRoute(name: '/experience/form/',     view: () => ExperienceFormView());
    registerRoute(name: '/experience/form/:key', view: () => ExperienceFormView());
    registerRoute(name: '/experience',           view: () => ExperienceShowView());
    registerRoute(name: '/experience/:key',      view: () => ExperienceShowView());
    registerRoute(name: '/portfolio/form',       view: () => PortfolioFormView());
    registerRoute(name: '/portfolio/form/:key',  view: () => PortfolioFormView());
    registerRoute(name: '/portfolio',            view: () => PortfolioShowView());
    registerRoute(name: '/portfolio/:key',       view: () => PortfolioShowView());
    registerRoute(name: '/skill/form',           view: () => SkillFormView());
    registerRoute(name: '/skill/form/:key',      view: () => SkillFormView());
    registerRoute(name: '/skill',                view: () => SkillShowView());
    registerRoute(name: '/skill/:key',           view: () => SkillShowView());
    registerRoute(name: '/language/form',        view: () => LanguageFormView());
    registerRoute(name: '/language/form/:key',   view: () => LanguageFormView());
    registerRoute(name: '/language',             view: () => LanguageShowView());
    registerRoute(name: '/language/:key',        view: () => LanguageShowView());
    registerRoute(name: '/cv/form',              view: () => CVFormView());
    registerRoute(name: '/cv',                   view: () => CVShowView());
    registerRoute(name: '/cv/:key',              view: () => CVShowView());
  }

}