import 'package:career_switch/widgets/answer_option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('AnswerOption reports taps and shows its selected state', (
    tester,
  ) async {
    var taps = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnswerOption(
            label: 'Admin or office work',
            selected: true,
            onTap: () => taps++,
          ),
        ),
      ),
    );

    expect(find.text('Admin or office work'), findsOneWidget);
    expect(find.byIcon(Icons.radio_button_checked), findsOneWidget);

    await tester.tap(find.text('Admin or office work'));
    expect(taps, 1);
  });
}
