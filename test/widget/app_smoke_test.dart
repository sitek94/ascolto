import 'package:flutter_test/flutter_test.dart';
import 'package:ascolto/app/ascolto_app.dart';
import 'package:ascolto/features/questions/deck_catalog.dart';

void main() {
  testWidgets('App builds and shows title and all six decks', (tester) async {
    await tester.pumpWidget(const AscoltoApp());
    await tester.pumpAndSettle();

    expect(find.text('Ascolto'), findsOneWidget);

    for (final deck in deckCatalog) {
      expect(
        find.text(deck.title),
        findsOneWidget,
        reason: 'Expected deck title ${deck.title} to be visible',
      );
    }
  });
}
