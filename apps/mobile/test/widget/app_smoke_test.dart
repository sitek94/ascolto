import 'package:flutter_test/flutter_test.dart';
import 'package:genuine_gossip/app/genuine_gossip_app.dart';
import 'package:genuine_gossip/features/questions/deck_catalog.dart';

void main() {
  testWidgets('App builds and shows title and all six decks', (tester) async {
    await tester.pumpWidget(const GenuineGossipApp());
    await tester.pumpAndSettle();

    expect(find.text('Genuine Gossip'), findsOneWidget);

    for (final deck in deckCatalog) {
      expect(
        find.text(deck.title),
        findsOneWidget,
        reason: 'Expected deck title ${deck.title} to be visible',
      );
    }
  });
}
