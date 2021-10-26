import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//CLARO
ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFFF9F9),
  colorScheme: ColorScheme.light(
      secondary: Colors.brown[700]!,
      secondaryVariant: Colors.brown,
  ),
  scaffoldBackgroundColor: const Color(0xFFFFF9F9),
  appBarTheme: const AppBarTheme(
      color: Color(0xFFFFF9F9),
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
    backgroundColor: Color(0xFFE9E3E3),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black38,
  ),
);

//ESCURO
ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF222020),
  colorScheme: const ColorScheme.dark(
    secondary: Color(0xFF6A5952),
    secondaryVariant: Color(0xFFad8b84)
  ),
  scaffoldBackgroundColor: const Color(0xFF222020),
  appBarTheme: const AppBarTheme(
      color: Color(0xFF222020),
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFFF9F9))),
  cardTheme: const CardTheme(
    color: Color(0xFF323030),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1D1B1B),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF383434),
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
