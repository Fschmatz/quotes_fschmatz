import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//CLARO
ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFFFDFD),
  accentColor: Colors.brown,
  scaffoldBackgroundColor: const Color(0xFFFFFDFD),
  appBarTheme: const AppBarTheme(
      color: Color(0xFFFFFDFD),
      elevation: 0,
      iconTheme: IconThemeData(
          color: Color(0xFF000000)
      ),
      titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000))),
  cardTheme: const CardTheme(
    color: Color(0xFFF3F1F1),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(color: Colors.brown),
    selectedLabelStyle: TextStyle(color: Colors.brown),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    backgroundColor: Colors.black12,
  ),
  accentTextTheme: const TextTheme(
    headline1: TextStyle(color: Colors.brown),
    headline2: TextStyle(color: Color(0xFFF3F1F1)),
  ),
  bottomAppBarColor: const Color(0xFFE8E6E6),
);

//ESCURO
ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF222020),
  accentColor: const Color(0xFF6A5952),
  scaffoldBackgroundColor: const Color(0xFF222020),
  appBarTheme: const AppBarTheme(
      color: Color(0xFF222020),
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFFFDFD))),
  cardTheme: const CardTheme(
    color: Color(0xFF323030),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(color: Color(0xFF6A5952)),
    selectedLabelStyle: TextStyle(color: Color(0xFF6A5952)),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    backgroundColor: Color(0xFF1D1B1B),
  ),
  bottomAppBarColor: const Color(0xFF171515),
  accentTextTheme: const TextTheme(
    headline1: TextStyle(color: Color(0xFF6A5952)),
    headline2: TextStyle(color: Color(0xFF000000)),
  ),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = 'valorTema';
  late SharedPreferences prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, _darkTheme);
  }
}
