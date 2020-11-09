import 'package:flutter/material.dart';
import 'package:hacker_news/apis/storiesApi.dart';
import 'package:hacker_news/blocs/storiesBloc.dart';
import 'package:hacker_news/screens/storiesScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider(
      create: (_) => StoriesBloc(storyApi: StoryApi()),
      child: HackerNewsApp(),
    ),
  );
}

class HackerNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoriesScreen(),
    );
  }
}
