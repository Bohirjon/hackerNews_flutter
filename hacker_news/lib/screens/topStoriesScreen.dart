import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/apis/topStoriesApi.dart';
import 'package:hacker_news/blocs/topStoriesBloc.dart';
import 'package:hacker_news/widgets/stories_tile.dart';

class TopStoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = TopStoriesBloc(topStoryApi: TopStoryApi());
    bloc.fetchTopStories();
    return Scaffold(
      body: buildBody(context, bloc),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hacker news"),
      ),
    );
  }

  Widget buildBody(BuildContext context, TopStoriesBloc bloc) {
    return StreamBuilder<List<int>>(
      stream: bloc.topStoriesStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildListView(bloc, snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildListView(TopStoriesBloc bloc, List<int> storiesId) {
    return ListView.builder(
      itemCount: storiesId.length,
      itemBuilder: (context, index) {
        final id = storiesId[index];
        bloc.fetchItem(id);
        return StoriesTile(
          bloc: bloc,
          itemId: id,
        );
      },
    );
  }
}
