enum QuestionTopic {
  connection,
  communication,
  fun,
  future,
  coreValues,
  lifestyle,
  intimacy,
}

enum QuestionVibe { playful, reflective, deep, flirty }

enum QuestionExplicitness { none, suggestive, sexual }

enum QuestionFormat { question, prompt, challenge }

final class Question {
  const Question({
    required this.id,
    required this.text,
    required this.topic,
    required this.vibe,
    required this.explicitness,
    required this.format,
  });

  final String id;
  final String text;
  final QuestionTopic topic;
  final QuestionVibe vibe;
  final QuestionExplicitness explicitness;
  final QuestionFormat format;
}
