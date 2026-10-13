import 'package:flutter/material.dart';

import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class AppColors {
  static const primary = Color(0xFF186B64);
  static const primaryDark = Color(0xFF0F4F4A);
  static const background = Color(0xFFF3F8F6);
  static const surface = Colors.white;
  static const textDark = Color(0xFF12302D);
  static const textMuted = Color(0xFF6B7C79);
  static const border = Color(0xFFDCE6E3);
  static const mint = Color(0xFFDDEFEA);
  static const orange = Color(0xFFE8743B);
  static const orangeSoft = Color(0xFFFDEEE4);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detección Canina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: null,
      ),
      home: const LoginScreen(),
    );
  }
}