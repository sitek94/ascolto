import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:questions_app/features/questions/deck_definition.dart';
import 'package:questions_app/features/session/session_screen.dart';

void main() {
  const deck = DeckDefinition(
    id: DeckId.shuffleEverything,
    title: 'Empty deck',
    description: 'No questions',
  );

  testWidgets('Empty deck shows message and can return', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const SessionScreen(
                          deck: deck,
                          questions: [],
                        ),
                      ),
                    );
                  },
                  child: const Text('Open session'),
                ),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Open session'));
    await tester.pumpAndSettle();

    expect(find.text('No questions in this deck yet.'), findsOneWidget);

    await tester.tap(find.text('Choose another deck'));
    await tester.pumpAndSettle();

    expect(find.text('Open session'), findsOneWidget);
  });
}
