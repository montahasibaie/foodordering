import 'package:foodordering/core/translation/languages/ar_language.dart';
import 'package:foodordering/core/translation/languages/en_language.dart';
import 'package:get/get.dart';

class AppTranlation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": ENLanguage.map,
        "ar_SA": ARLanguage.map,
      };
}

tr(String key) => key.tr;
