import 'package:flutter/material.dart';
import 'package:login_page/const/checkBox_state.dart';
import 'package:login_page/const/consts.dart';

class WidgetProvider extends ChangeNotifier {
  int index = 0;
  bool isDark = true;
  ThemeData? themeData;
  bool isCheck = false;

  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isDark) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Widget buildingSingleCheckbox(CheckBoxState checkBox, int index) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.red,
      title: Text(
        checkBox.title,
        style: AppStyle.textStyle,
      ),
      value: checkBox.value,
      onChanged: (value) {
        checkBox.value = value!;
        notifyListeners();
      },
    );
  }

  void addArr(int index) {
    if (index == 0) {
      Consts.answers.clear();
      Consts.answers.addAll([
        [
          'a) mandag morgen. ',
          'b)  torsdag eftermiddag ',
          'c) lørdag aften  ',
        ],
        [
          'a) til fest ',
          'b) til sine forældre ',
          'c) i skole ',
        ],
        [
          'a) en ung mand ',
          'b) en dame ',
          'c) en gammel mand',
        ],
      ]);
    } else if (index == 1) {
      Consts.answers.clear();
      Consts.answers.addAll([
        [
          'a) 17 år  ',
          'b) 7 år  ',
          'c) 13 år  ',
        ],
        [
          'a) en lille lejlighed med en stue, et køkken, et badeværelse, en gang  ',
          'b) en stor lejlighed med en stue, et køkken, 3 værelser, et badeværelse, en gang.  ',
          'c)  en lille lejlighed med et værelse, et badeværelse, et køkken, en gang. ',
        ],
        [
          'a) Hun kan ikke lide mennesker.',
          'b) Hun har problemer med sine forældre. ',
          'c) Hun kan bestemme, hvor møblerne skal stå.',
        ],
      ]);
    } else if (index == 2) {
      Consts.answers.clear();
      Consts.answers.addAll([
        [
          'a) i vandet ',
          'b) i muslinger',
          'c) i sandet',
        ],
        [
          'a) en slave  ',
          'b) en hund  ',
          'c) en ung dame  ',
        ],
        [
          'a) i vandet ',
          'b) i sandet , inde i skallen ',
          'c) på vejen',
        ],
      ]);
    }
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );
}
