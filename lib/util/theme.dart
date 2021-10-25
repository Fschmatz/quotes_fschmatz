import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//CLARO
ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFFFBFB),
  accentColor: Colors.brown,
  scaffoldBackgroundColor: const Color(0xFFFFFBFB),
  appBarTheme: const AppBarTheme(
      color: Color(0xFFFFFBFB),
      elevation: 0,
      iconTheme: IconThemeData(
          color: Color(0xFF000000)
      ),
      titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000))),
  cardTheme: const CardTheme(
    color: Color(0xFFF5F1F1),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFEFEBEB),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black26,
  ),
  accentTextTheme: const TextTheme(
    headline1: TextStyle(color: Colors.brown),
    headline2: TextStyle(color: Color(0xFFF5F1F1)),
  ),
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
          color: Color(0xFFFFFBFB))),
  cardTheme: const CardTheme(
    color: Color(0xFF323030),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1D1B1B),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF343030),
  ),
  accentTextTheme: const TextTheme(
    headline1: TextStyle(color: Color(0xFF7a6f6a)),
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
