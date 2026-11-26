import 'package:career_switch/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Welcome screen shows the headline and both buttons', (
    tester,
  ) async {
    await tester.pumpWidget(const CareerSwitchApp());

    expect(find.text('Switch into tech with a plan'), findsOneWidget);
    expect(find.text('Start the quiz'), findsOneWidget);
    expect(find.text('I already have an account'), findsOneWidget);
  });
}
