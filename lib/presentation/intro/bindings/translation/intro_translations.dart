import 'package:resumebuilderadmin/wtoolbox/translation/wt_translations.dart';
import 'intro_en_us_translations.dart';
import 'intro_me_mne_translations.dart';

class IntroTranslations extends WTTranslations {

  @override
  Map<String, Map<String, String>> get keys => {
    'me_MNE': IntroMeMneTranslations().keys['me_MNE']!,
    'en_US':  IntroEnUsTranslations().keys['en_US']!,
  };

}