import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/apis/topStoriesApi.dart';
import 'package:hacker_news/blocs/topStoriesBloc.dart';

class TopStoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = TopStoriesBloc(topStoryApi: TopStoryApi());
    bloc.fetchTopStories();
    return CupertinoPageScaffold(
      child: buildBody(context, bloc),
      navigationBar: CupertinoNavigationBar(
        middle: Text("Hacker news"),
      ),
    );
  }

  Widget buildBody(BuildContext context, TopStoriesBloc bloc) {
    return StreamBuilder<List<int>>(
      stream: bloc.topStoriesStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildListView(snapshot.data);
        } else {
          return CupertinoActivityIndicator(
            animating: true,
            radius: 14,
          );
        }
      },
    );
  }

  Widget buildListView(List<int> storiesId) {
    return ListView.builder(
      itemCount: storiesId.length,
      itemBuilder: (context, index) {
        return Text(storiesId[index].toString());
      },
    );
  }
}
