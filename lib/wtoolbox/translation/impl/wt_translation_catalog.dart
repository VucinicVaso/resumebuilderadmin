import '../wt_translations.dart';
import 'wt_me_mne_translations.dart';
import 'wt_en_us_translations.dart';

class WTTranslationCatalog extends WTTranslations {

  @override
  Map<String, Map<String, String>> get keys => {
    'me_MNE': WTMeMneTranslations().keys['me_MNE']!,
    'en_US':  WTEnUsTranslations().keys['en_US']!,
  };

}