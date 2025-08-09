import 'package:wtoolboxweb/translation/wtw_translations.dart';
import 'dashboard_en_us_translations.dart';
import 'dashboard_me_mne_translations.dart';

class DashboardTranslations extends WTWTranslations {

  @override
  Map<String, Map<String, String>> get keys => {
    'me_MNE': DashboardMeMneTranslations().keys['me_MNE']!,
    'en_US':  DashboardEnUsTranslations().keys['en_US']!,
  };

}