import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'ui/screens/main_screen.dart'; // importa el nuevo archivo

void main() {
  runApp(const TuristikApp());
}

class TuristikApp extends StatelessWidget {
  const TuristikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turistik',
      theme: AppTheme.light,
      home: const MainScreen(), // usa MainScreen
      debugShowCheckedModeBanner: false,
    );
  }
}
