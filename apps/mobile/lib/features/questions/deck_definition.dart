import 'question.dart';

enum DeckId {
  shuffleEverything,
  warmLight,
  deepTalk,
  playfulEnergy,
  relationshipCheckIn,
  intimate,
}

final class DeckDefinition {
  const DeckDefinition({
    required this.id,
    required this.title,
    required this.description,
  });

  final DeckId id;
  final String title;
  final String description;

  bool matches(Question question) {
    switch (id) {
      case DeckId.shuffleEverything:
        return true;
      case DeckId.warmLight:
        return question.explicitness == QuestionExplicitness.none &&
            (question.vibe == QuestionVibe.playful ||
                question.vibe == QuestionVibe.reflective);
      case DeckId.deepTalk:
        return question.vibe == QuestionVibe.deep;
      case DeckId.playfulEnergy:
        return question.vibe == QuestionVibe.playful;
      case DeckId.relationshipCheckIn:
        if (question.explicitness != QuestionExplicitness.none) return false;
        switch (question.topic) {
          case QuestionTopic.connection:
          case QuestionTopic.communication:
          case QuestionTopic.future:
          case QuestionTopic.lifestyle:
          case QuestionTopic.coreValues:
            return true;
          case QuestionTopic.fun:
          case QuestionTopic.intimacy:
            return false;
        }
      case DeckId.intimate:
        return question.topic == QuestionTopic.intimacy;
    }
  }
}
