import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_2/main.dart';

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const InsureChainApp());
    expect(find.text('InsureChain'), findsOneWidget);
  });
}
