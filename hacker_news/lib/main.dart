import 'package:flutter/material.dart';
import 'package:hacker_news/apis/topStoriesApi.dart';
import 'package:hacker_news/blocs/topStoriesBloc.dart';
import 'package:hacker_news/screens/topStoriesScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider(
      create: (_) => TopStoriesBloc(topStoryApi: TopStoryApi()),
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
