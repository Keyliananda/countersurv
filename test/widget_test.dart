import 'package:countersurv/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the MVP risk dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const CounterSurvApp());

    expect(find.text('CounterSurv'), findsOneWidget);
    expect(find.text('Risk Dashboard'), findsOneWidget);
    expect(find.text('2 MVP-Module aktiv'), findsOneWidget);
    expect(find.text('Datenbroker'), findsOneWidget);
    expect(find.text('Telefon'), findsOneWidget);
    expect(find.byIcon(Icons.settings_outlined), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -400));
    await tester.pumpAndSettle();

    expect(find.text('Beweisprotokoll vorbereiten'), findsOneWidget);
  });
}
