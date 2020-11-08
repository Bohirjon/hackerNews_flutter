import 'package:flutter/cupertino.dart';
import 'package:hacker_news/blocs/topStoriesBloc.dart';
import 'package:hacker_news/blocs/topStoriesProvider.dart';
import 'package:hacker_news/screens/topStoriesScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(HackerNewsApp());
}

class HackerNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: TopStoriesScreen(),
    );
  }
}
