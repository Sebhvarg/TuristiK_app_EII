import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; // 👈 importa esto
import 'core/theme/app_theme.dart';
import 'ui/screens/main_screen.dart';

void main() {
  setUrlStrategy(const HashUrlStrategy()); // 👈 usa esto para rutas con #
  runApp(const TuristikApp());
}

class TuristikApp extends StatelessWidget {
  const TuristikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turistik',
      theme: AppTheme.light,
      home: const MainScreen(initialIndex: 2),
      debugShowCheckedModeBanner: false,
    );
  }
}
