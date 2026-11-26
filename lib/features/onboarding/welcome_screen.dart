import 'package:material_ui/material_ui.dart';

import '../../theme/app_theme.dart';
import '../../widgets/app_buttons.dart';

/// Screen 01 in Figma. The quiz and sign-in routes are wired up in Sprint 2.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const CircleAvatar(radius: 28, backgroundColor: AppColors.teal),
              const SizedBox(height: AppSpacing.gap),
              Text(
                'Switch into tech with a plan',
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.gap),
              Text(
                "Answer 8 quick questions. We'll match you to tech roles "
                'that use what you already know.',
                style: textTheme.bodyMedium,
              ),
              const Spacer(),
              PrimaryButton(label: 'Start the quiz', onPressed: () {}),
              const SizedBox(height: 12),
              SecondaryButton(
                label: 'I already have an account',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
