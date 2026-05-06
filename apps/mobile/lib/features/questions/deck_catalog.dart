import 'deck_definition.dart';
import 'question.dart';
import 'question_catalog.dart';

const deckCatalog = <DeckDefinition>[
  DeckDefinition(
    id: DeckId.shuffleEverything,
    title: 'Shuffle Everything',
    description: 'A mix of every question, in random order.',
  ),
  DeckDefinition(
    id: DeckId.warmLight,
    title: 'Warm & Light',
    description: 'Easy, warm prompts to soften the mood.',
  ),
  DeckDefinition(
    id: DeckId.deepTalk,
    title: 'Deep Talk',
    description: 'Slower questions for a real conversation.',
  ),
  DeckDefinition(
    id: DeckId.playfulEnergy,
    title: 'Playful Energy',
    description: 'Light, fun prompts to make each other smile.',
  ),
  DeckDefinition(
    id: DeckId.relationshipCheckIn,
    title: 'Relationship Check-in',
    description: 'Quick check-in across the things that matter.',
  ),
  DeckDefinition(
    id: DeckId.intimate,
    title: 'Intimate',
    description: 'Closer, more personal prompts for the two of you.',
  ),
];

List<Question> questionsForDeck(DeckDefinition deck) {
  return questionCatalog.where(deck.matches).toList(growable: false);
}
