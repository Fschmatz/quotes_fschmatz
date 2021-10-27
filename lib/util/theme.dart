import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//CLARO
ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFF0E7E5),
  colorScheme: ColorScheme.light(
      secondary: Colors.brown.shade400,
      secondaryVariant: Colors.brown.shade600,
  ),
  scaffoldBackgroundColor: const Color(0xFFF0E7E5),
  appBarTheme: const AppBarTheme(
      color: Color(0xFFF0E7E5),
      elevation: 0,
      iconTheme: IconThemeData(
          color: Color(0xFF000000)
      ),
      titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000))),
  cardTheme: const CardTheme(
    color: Color(0xFFE6E0E0),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFE9E0E0),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFE9E0E0),
  ),
);

//ESCURO
ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF232020),
  colorScheme: const ColorScheme.dark(
    secondary: Color(0xFF6A5952),
    secondaryVariant: Color(0xFFad8b84)
  ),
  scaffoldBackgroundColor: const Color(0xFF232020),
  appBarTheme: const AppBarTheme(
      color: Color(0xFF232020),
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFFFFFF))),
  cardTheme: const CardTheme(
    color: Color(0xFF333030),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1D1A1A),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF393434),
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
