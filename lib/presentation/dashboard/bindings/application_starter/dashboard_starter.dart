import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/application_starter/wtw_application_starter.dart';
import '../../../../domain/repository/message/message_repository.dart';
import '../../../../data/repository/message/message_repository_impl.dart';
import '../../../../domain/repository/education/education_repository.dart';
import '../../../../data/repository/education/education_repository_impl.dart';
import '../../../../domain/repository/experience/experience_repository.dart';
import '../../../../data/repository/experience/experience_repository_impl.dart';
import '../../../../domain/repository/portfolio/portfolio_repository.dart';
import '../../../../data/repository/portfolio/portfolio_repository_impl.dart';
import '../../../../domain/repository/skill/skill_repository.dart';
import '../../../../data/repository/skill/skill_repository_impl.dart';
import '../../../../domain/repository/language/language_repository.dart';
import '../../../../data/repository/language/language_repository_impl.dart';
import '../../../../domain/repository/cv/cv_repository.dart';
import '../../../../data/repository/cv/cv_repository_impl.dart';
import '../message_broker/dashboard_message_broker.dart';
import '../translation/dashboard_translations.dart';
import '../routes/dashboard_routes.dart';

class DashboardStarter extends WTWApplicationStarter {

  @override
  Future<void> register() async {
    setTitle('ResumeBuilderAdmin');
    setSettings({});
    subscribeMessageBroker(DashboardMessageBroker());
    registerTranslations(DashboardTranslations());
    registerRoutes(DashboardRoutes());

    Get.put<MessageRepository>(MessageRepositoryImpl(), permanent: true);
    Get.put<EducationRepository>(EducationRepositoryImpl(), permanent: true);
    Get.put<ExperienceRepository>(ExperienceRepositoryImpl(), permanent: true);
    Get.put<PortfolioRepository>(PortfolioRepositoryImpl(), permanent: true);
    Get.put<SkillRepository>(SkillRepositoryImpl(), permanent: true);
    Get.put<LanguageRepository>(LanguageRepositoryImpl(), permanent: true);
    Get.put<CVRepository>(CVRepositoryImpl(), permanent: true);
  }

  @override
  Future<void> unregister() async {
    unregisterTranslations();
    unregisterRoutes();
    unsubscribeMessageBroker();

    await Get.delete<MessageRepository>(force: true);
    await Get.delete<EducationRepository>(force: true);
    await Get.delete<ExperienceRepository>(force: true);
    await Get.delete<PortfolioRepository>(force: true);
    await Get.delete<SkillRepository>(force: true);
    await Get.delete<LanguageRepository>(force: true);
    await Get.delete<CVRepository>(force: true);
  }
  
}