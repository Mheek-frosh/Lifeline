import 'package:flutter_test/flutter_test.dart';
import 'package:lifeline/main.dart';

void main() {
  testWidgets('LifeLine app loads onboarding screen', (WidgetTester tester) async {
    await tester.pumpWidget(const LifeLineApp());

    expect(find.text('Save Lives'), findsOneWidget);
  });
}
