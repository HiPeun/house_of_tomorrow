import 'package:flutter/widgets.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

class LangService with ChangeNotifier {
  LangService({Locale? locale}) : locale = locale ?? IntlHelper.en;
  Locale locale;

  //언어 변경 담당함수
  void toggleLang() {
    locale = IntlHelper.isKo ? IntlHelper.en : IntlHelper.ko;
    notifyListeners();

  }
}
