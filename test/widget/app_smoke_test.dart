import 'package:flutter_test/flutter_test.dart';
import 'package:questions_app/app/questions_app.dart';
import 'package:questions_app/features/questions/deck_catalog.dart';

void main() {
  testWidgets('App builds and shows title and all six decks', (tester) async {
    await tester.pumpWidget(const QuestionsApp());
    await tester.pumpAndSettle();

    expect(find.text('Questions'), findsOneWidget);

    for (final deck in deckCatalog) {
      expect(
        find.text(deck.title),
        findsOneWidget,
        reason: 'Expected deck title ${deck.title} to be visible',
      );
    }
  });
}
