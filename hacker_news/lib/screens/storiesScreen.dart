import 'package:flutter/material.dart';
import 'package:hacker_news/blocs/storiesBloc.dart';
import 'package:hacker_news/widgets/stories_tile.dart';
import 'package:provider/provider.dart';

class StoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<StoriesBloc>(context);
    bloc.fetchTopStories();
    return Scaffold(
      body: buildBody(context, bloc),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hacker news"),
      ),
    );
  }

  Widget buildBody(BuildContext context, StoriesBloc bloc) {
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

  Widget buildListView(StoriesBloc bloc, List<int> storiesId) {
    return ListView.builder(
      itemCount: storiesId.length,
      itemBuilder: (context, index) {
        final id = storiesId[index];
        bloc.fetchItem(id);
        return StoriesTile(itemId: id);
      },
    );
  }
}