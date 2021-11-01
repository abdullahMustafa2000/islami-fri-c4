import 'package:flutter/material.dart';
import 'package:islami_fri/storage_preference/preference_class.dart';

class MyAppProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;


  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    _themeMode = value;
  }

  MyAppProvider() {
    StorageManager.readData('themeMode').then((value) {
      var darkMode = value ?? true;
      if (darkMode) {
        themeMode = ThemeMode.dark;
      } else {
        themeMode = ThemeMode.light;
      }
      notifyListeners();
    }
    );
  }

  bool isDark(BuildContext context) =>
      themeMode == ThemeMode.dark/* ||
      MediaQuery.of(context).platformBrightness == Brightness.dark*/;

  void toggleTheme(bool dark) {
    if(dark == (themeMode == ThemeMode.dark)) {
      return;
    }
    themeMode = dark ? ThemeMode.dark : ThemeMode.light;
    StorageManager.saveData('themeMode', dark);
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: MyDarkColors.white),
        iconTheme: IconThemeData(
          color: MyDarkColors.selectedIconColor,
        ), // set backbutton color here which will reflect in all screens.
      ),
      primaryColor: MyDarkColors.primaryColor,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: MyDarkColors.primaryColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: MyDarkColors.selectedIconColor,
        unselectedItemColor: MyDarkColors.white,
        backgroundColor: MyDarkColors.primaryColor,
      ),
      colorScheme: const ColorScheme.dark().copyWith(
          secondary: MyDarkColors.primaryColor,
          primaryVariant: MyDarkColors.selectedIconColor,
          primary: MyDarkColors.colorYellow,
          secondaryVariant: MyDarkColors.colorBlack));

  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
        secondary: MyLightColors.white,
        primaryVariant: MyLightColors.selectedIconColor,
        primary: MyLightColors.primaryColor,
        secondaryVariant: MyLightColors.white),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: MyLightColors.colorBlack
      ),
      iconTheme: IconThemeData(
        color: MyLightColors.colorBlack,
      ), // set backbutton color here which will reflect in all screens.
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: MyLightColors.selectedIconColor,
      unselectedItemColor: MyDarkColors.white,
      backgroundColor: MyLightColors.primaryColor,
    ),
    primaryColor: MyLightColors.primaryColor,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: MyLightColors.primaryColor),
  );
}

class MyLightColors {
  static const Color primaryColor = Color.fromRGBO(183, 147, 95, 1.0);
  static const selectedIconColor = Color.fromRGBO(36, 36, 35, 1.0);
  static const white = Color.fromRGBO(255, 255, 255, 1.0);
  static const colorBlack = Color.fromRGBO(5, 5, 5, 1.0);
}

class MyDarkColors {
  static const Color primaryColor = Color.fromRGBO(20, 26, 46, 1.0);
  static const Color colorYellow = Color.fromRGBO(250, 204, 29, 1.0);
  static const Color selectedIconColor = Color.fromRGBO(250, 204, 29, 1.0);
  static const white = Color.fromRGBO(255, 255, 255, 1.0);
  static const colorBlack = Color.fromRGBO(5, 5, 5, 1.0);
}
