import 'package:flutter_test/flutter_test.dart';
import 'package:questions_app/features/questions/deck_catalog.dart';
import 'package:questions_app/features/questions/deck_definition.dart';
import 'package:questions_app/features/questions/question.dart';
import 'package:questions_app/features/questions/question_catalog.dart';

void main() {
  group('deckCatalog', () {
    test('contains exactly six decks', () {
      expect(deckCatalog.length, 6);
    });

    test('deck IDs are unique', () {
      final ids = deckCatalog.map((d) => d.id).toSet();
      expect(ids.length, deckCatalog.length);
    });

    test('every DeckId is represented', () {
      final ids = deckCatalog.map((d) => d.id).toSet();
      expect(ids, DeckId.values.toSet());
    });
  });

  group('questionCatalog', () {
    test('question IDs are unique', () {
      final ids = questionCatalog.map((q) => q.id).toSet();
      expect(ids.length, questionCatalog.length);
    });

    test('contains at least 24 questions', () {
      expect(questionCatalog.length, greaterThanOrEqualTo(24));
    });
  });

  group('questionsForDeck', () {
    test('every deck returns at least two matching questions', () {
      for (final deck in deckCatalog) {
        final result = questionsForDeck(deck);
        expect(
          result.length,
          greaterThanOrEqualTo(2),
          reason: 'Deck ${deck.id} should match at least 2 questions',
        );
      }
    });

    test('Warm & Light excludes suggestive and sexual questions', () {
      final deck = deckCatalog.firstWhere((d) => d.id == DeckId.warmLight);
      final results = questionsForDeck(deck);
      for (final q in results) {
        expect(q.explicitness, QuestionExplicitness.none);
        expect(
          q.vibe == QuestionVibe.playful || q.vibe == QuestionVibe.reflective,
          isTrue,
        );
      }
    });

    test('Intimate returns only intimacy topic', () {
      final deck = deckCatalog.firstWhere((d) => d.id == DeckId.intimate);
      final results = questionsForDeck(deck);
      expect(results, isNotEmpty);
      for (final q in results) {
        expect(q.topic, QuestionTopic.intimacy);
      }
    });

    test('Shuffle Everything returns the full catalog', () {
      final deck =
          deckCatalog.firstWhere((d) => d.id == DeckId.shuffleEverything);
      final results = questionsForDeck(deck);
      expect(results.length, questionCatalog.length);
    });

    test('Deep Talk only returns deep vibe questions', () {
      final deck = deckCatalog.firstWhere((d) => d.id == DeckId.deepTalk);
      final results = questionsForDeck(deck);
      expect(results, isNotEmpty);
      for (final q in results) {
        expect(q.vibe, QuestionVibe.deep);
      }
    });

    test('Playful Energy only returns playful vibe questions', () {
      final deck = deckCatalog.firstWhere((d) => d.id == DeckId.playfulEnergy);
      final results = questionsForDeck(deck);
      expect(results, isNotEmpty);
      for (final q in results) {
        expect(q.vibe, QuestionVibe.playful);
      }
    });

    test('Relationship Check-in respects topic and explicitness rules', () {
      final deck =
          deckCatalog.firstWhere((d) => d.id == DeckId.relationshipCheckIn);
      final allowedTopics = {
        QuestionTopic.connection,
        QuestionTopic.communication,
        QuestionTopic.future,
        QuestionTopic.lifestyle,
        QuestionTopic.coreValues,
      };
      final results = questionsForDeck(deck);
      expect(results, isNotEmpty);
      for (final q in results) {
        expect(q.explicitness, QuestionExplicitness.none);
        expect(allowedTopics.contains(q.topic), isTrue);
      }
    });
  });
}
