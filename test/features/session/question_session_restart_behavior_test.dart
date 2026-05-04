import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:questions_app/features/questions/deck_definition.dart';
import 'package:questions_app/features/questions/question.dart';
import 'package:questions_app/features/session/question_session.dart';

const _deck = DeckDefinition(
  id: DeckId.shuffleEverything,
  title: 'Deck',
  description: 'Deck',
);

List<Question> _makeQuestions(int count) {
  return List<Question>.generate(
    count,
    (i) => Question(
      id: 'q_$i',
      text: 'Question $i',
      topic: QuestionTopic.connection,
      vibe: QuestionVibe.reflective,
      explicitness: QuestionExplicitness.none,
      format: QuestionFormat.question,
    ),
  );
}

void main() {
  test('restart resets progress and preserves the question set', () {
    final questions = _makeQuestions(8);

    final started = QuestionSession.start(
      deck: _deck,
      questions: questions,
      random: Random(1),
    ).next().next().next();

    expect(started.completedCount, 3);

    final restarted = started.restart(random: Random(7));

    expect(restarted.completedCount, 0);
    expect(restarted.isFinished, isFalse);
    expect(restarted.currentQuestion, isNotNull);
    expect(restarted.totalCount, started.totalCount);
    expect(
      restarted.questions.map((q) => q.id).toSet(),
      started.questions.map((q) => q.id).toSet(),
    );
  });

  test('restart on an empty session stays empty and finished', () {
    final empty = QuestionSession.start(
      deck: _deck,
      questions: const <Question>[],
    );

    final restarted = empty.restart();

    expect(restarted.isEmpty, isTrue);
    expect(restarted.isFinished, isTrue);
    expect(restarted.totalCount, 0);
  });
}
