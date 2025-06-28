import 'package:resumebuilderadmin/core/translation/wtoolbox_translations.dart';
import 'app_en_us_translations.dart';
import 'app_me_mne_translations.dart';

class AppTranslations extends WTTranslations {

  @override
  Map<String, Map<String, String>> get keys => {
    'me_MNE': AppMeMneTranslations().keys['me_MNE']!,
    'en_US':  AppEnUsTranslations().keys['en_US']!,
  };

}