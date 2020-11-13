import 'package:flutter/material.dart';
import 'package:hacker_news/blocs/storiesBloc.dart';
import 'package:hacker_news/datas/story_type.dart';
import 'package:provider/provider.dart';

class StoriesScreenBottomNavigationBar extends StatefulWidget {
  final Function onNavigationItemSelected;

  StoriesScreenBottomNavigationBar({this.onNavigationItemSelected});

  @override
  _StoriesScreenBottomNavigationBarState createState() =>
      _StoriesScreenBottomNavigationBarState();
}

class _StoriesScreenBottomNavigationBarState
    extends State<StoriesScreenBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.new_releases), label: "News"),
        BottomNavigationBarItem(
          label: "Tops",
          icon: Icon(Icons.border_top),
        ),
        BottomNavigationBarItem(
          label: "Best",
          icon: Icon(Icons.vertical_align_top),
        )
      ],
      onTap: (index) {
        widget.onNavigationItemSelected(index);
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
