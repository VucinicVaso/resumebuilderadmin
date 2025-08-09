import 'package:wtoolboxweb/translation/wtw_translations.dart';
import 'intro_en_us_translations.dart';
import 'intro_me_mne_translations.dart';

class IntroTranslations extends WTWTranslations {

  @override
  Map<String, Map<String, String>> get keys => {
    'me_MNE': IntroMeMneTranslations().keys['me_MNE']!,
    'en_US':  IntroEnUsTranslations().keys['en_US']!,
  };

}