import 'package:flutter/material.dart';

import '../features/deck_selection/deck_list_screen.dart';
import '../ui/app_theme.dart';

class QuestionsApp extends StatelessWidget {
  const QuestionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questions',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      themeMode: ThemeMode.light,
      home: const DeckListScreen(),
    );
  }
}
