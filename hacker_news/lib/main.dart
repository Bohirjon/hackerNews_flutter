import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/screens/topStoriesScreen.dart';

void main() {
  runApp(HackerNewsApp());
}

class HackerNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TopStoriesScreen(),
    );
  }
}
