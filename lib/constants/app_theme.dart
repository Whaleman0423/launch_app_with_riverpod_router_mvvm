part of './values.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF212121),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
    bodyMedium: TextStyle(color: Color(0xFF969696), fontSize: 14),
    bodySmall: TextStyle(color: Colors.white, fontSize: 12),
    labelLarge: TextStyle(
        color: Color(0xFFFBCCBC), fontSize: 14, fontWeight: FontWeight.bold),
    labelMedium: TextStyle(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
    labelSmall: TextStyle(
        color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);
