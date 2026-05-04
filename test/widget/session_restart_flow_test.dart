import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:questions_app/app/questions_app.dart';
import 'package:questions_app/features/questions/deck_catalog.dart';
import 'package:questions_app/features/questions/deck_definition.dart';

void main() {
  testWidgets('Restart returns the session to the beginning', (tester) async {
    await tester.pumpWidget(const QuestionsApp());
    await tester.pumpAndSettle();

    final deck = deckCatalog.firstWhere((d) => d.id == DeckId.intimate);
    final count = questionsForDeck(deck).length;
    expect(count, greaterThanOrEqualTo(2));

    final deckFinder = find.text(deck.title);
    await tester.ensureVisible(deckFinder);
    await tester.pumpAndSettle();
    await tester.tap(deckFinder);
    await tester.pumpAndSettle();

    for (var i = 0; i < count; i++) {
      await tester.tap(find.widgetWithText(FilledButton, 'Next'));
      await tester.pumpAndSettle();
    }

    expect(find.text('You finished this deck'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Restart deck'));
    await tester.pumpAndSettle();

    expect(find.text('1 / $count'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Next'), findsOneWidget);
    expect(find.text('You finished this deck'), findsNothing);
  });
}
