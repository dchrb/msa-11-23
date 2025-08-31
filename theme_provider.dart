import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Color _primaryColor = Colors.blue;

  ThemeMode get themeMode => _themeMode;
  Color get primaryColor => _primaryColor;

  ThemeProvider() {
    _loadThemeMode();
  }

  void _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

    final colorValue = prefs.getInt('primaryColor');
    if (colorValue != null) {
      _primaryColor = Color(colorValue);
    } else {
      _primaryColor = Colors.blue;
      await prefs.setInt('primaryColor', _primaryColor.value);
    }

    notifyListeners();
  }

  void toggleTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setPrimaryColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('primaryColor', color.value);
    _primaryColor = color;
    notifyListeners();
  }
}

class MyThemes {
  static bool isColorLight(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.light;
  }

  static final lightTheme = (Color primaryColor) {
    final onPrimary = isColorLight(primaryColor) ? Colors.black : Colors.white;
    final onSurface = Colors.black;

    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(primaryColor.value, const <int, Color>{
          50: Color(0xFFE3F2FD), 100: Color(0xFFBBDEFB), 200: Color(0xFF90CAF9),
          300: Color(0xFF64B5F6), 400: Color(0xFF42A5F5), 500: Color(0xFF2196F3),
          600: Color(0xFF1E88E5), 700: Color(0xFF1976D2), 800: Color(0xFF1565C0),
          900: Color(0xFF0D47A1),
        }),
        accentColor: primaryColor,
        brightness: Brightness.light,
      ).copyWith(
        onPrimary: onPrimary,
        onSurface: onSurface,
        surface: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFFF0F0F0),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        titleTextStyle: TextStyle(
          color: onPrimary,
          fontSize: 20, 
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: onPrimary,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: onSurface),
        bodyMedium: TextStyle(color: onSurface),
        titleLarge: TextStyle(color: onSurface),
        titleMedium: TextStyle(color: onSurface),
      ),
      iconTheme: IconThemeData(
        color: onSurface,
      ),
    );
  };

  static final darkTheme = (Color primaryColor) {
    final onPrimary = isColorLight(primaryColor) ? Colors.black : Colors.white;
    final onSurface = Colors.white;

    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(primaryColor.value, const <int, Color>{
          50: Color(0xFFE3F2FD), 100: Color(0xFFBBDEFB), 200: Color(0xFF90CAF9),
          300: Color(0xFF64B5F6), 400: Color(0xFF42A5F5), 500: Color(0xFF2196F3),
          600: Color(0xFF1E88E5), 700: Color(0xFF1976D2), 800: Color(0xFF1565C0),
          900: Color(0xFF0D47A1),
        }),
        accentColor: primaryColor,
        brightness: Brightness.dark,
      ).copyWith(
        onPrimary: onPrimary,
        onSurface: onSurface,
        surface: const Color(0xFF1E1E1E),
      ),
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        titleTextStyle: TextStyle(
          color: onPrimary,
          fontSize: 20, 
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: onPrimary,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: onSurface),
        bodyMedium: TextStyle(color: onSurface),
        titleLarge: TextStyle(color: onSurface),
        titleMedium: TextStyle(color: onSurface),
      ),
      iconTheme: IconThemeData(
        color: onSurface,
      ),
    );
  };
}