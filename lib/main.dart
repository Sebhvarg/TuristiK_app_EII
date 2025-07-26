import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'ui/screens/main_screen.dart';

void main() {
  // Comentado temporalmente hasta que necesites soporte web
  // if (kIsWeb) {
  //   setUrlStrategy(const HashUrlStrategy());
  // }

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
