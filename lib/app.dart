import 'package:material_ui/material_ui.dart';

import 'features/onboarding/welcome_screen.dart';
import 'theme/app_theme.dart';

class CareerSwitchApp extends StatelessWidget {
  const CareerSwitchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Career Switch',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const WelcomeScreen(),
    );
  }
}
