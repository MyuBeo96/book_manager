import 'package:book_manager/data/spref/spref.dart';
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.pink,
    primaryColor: Colors.red,
    brightness: Brightness.dark,
    backgroundColor: Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.cyan,
    primaryColor: Colors.green,
    brightness: Brightness.light,
    backgroundColor: Colors.green,
    accentColor: Colors.green,
    accentIconTheme: IconThemeData(color: Colors.green),
    dividerColor: Colors.green,
  );

  ThemeData? _themeData;
  ThemeData getTheme() => _themeData!;

  ThemeNotifier() {
    SPref.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    SPref.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    SPref.saveData('themeMode', 'light');
    notifyListeners();
  }
}
