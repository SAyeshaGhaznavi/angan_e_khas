import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const AnganEKhasApp());
}

class AnganEKhasApp extends StatelessWidget {
  const AnganEKhasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angan-e-Khas',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}