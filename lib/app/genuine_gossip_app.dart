import 'package:flutter/material.dart';

import '../features/deck_selection/deck_list_screen.dart';
import '../ui/app_theme.dart';

class GenuineGossipApp extends StatelessWidget {
  const GenuineGossipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genuine Gossip',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      themeMode: ThemeMode.light,
      home: const DeckListScreen(),
    );
  }
}
