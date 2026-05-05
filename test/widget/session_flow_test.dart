import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ascolto/app/ascolto_app.dart';
import 'package:ascolto/features/questions/deck_catalog.dart';
import 'package:ascolto/features/questions/deck_definition.dart';

void main() {
  testWidgets('Full session flow: open deck, advance to finish, return', (
    tester,
  ) async {
    await tester.pumpWidget(const AscoltoApp());
    await tester.pumpAndSettle();

    final deck = deckCatalog.firstWhere((d) => d.id == DeckId.intimate);
    final deckQuestionCount = questionsForDeck(deck).length;
    expect(deckQuestionCount, greaterThanOrEqualTo(2));

    final deckFinder = find.text(deck.title);
    await tester.ensureVisible(deckFinder);
    await tester.pumpAndSettle();
    await tester.tap(deckFinder);
    await tester.pumpAndSettle();

    expect(find.text('1 / $deckQuestionCount'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Next'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Next'));
    await tester.pumpAndSettle();

    expect(find.text('2 / $deckQuestionCount'), findsOneWidget);

    for (var i = 1; i < deckQuestionCount; i++) {
      await tester.tap(find.widgetWithText(FilledButton, 'Next'));
      await tester.pumpAndSettle();
    }

    expect(find.text('You finished this deck'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Restart deck'), findsOneWidget);
    expect(find.text('Choose another deck'), findsOneWidget);

    await tester.tap(find.text('Choose another deck'));
    await tester.pumpAndSettle();

    expect(find.text('Ascolto'), findsOneWidget);
    for (final d in deckCatalog) {
      expect(find.text(d.title), findsOneWidget);
    }
  });
}
