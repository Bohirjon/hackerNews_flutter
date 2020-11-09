import 'package:flutter/material.dart';
import 'package:hacker_news/blocs/storiesBloc.dart';
import 'package:hacker_news/datas/story_type.dart';
import 'package:hacker_news/widgets/stories_tile.dart';
import 'package:provider/provider.dart';

class StoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<StoriesBloc>(context);
    //TODO:
    bloc.fetchStories(bloc.currentStoryType);
    return Scaffold(
      body: buildBody(context, bloc),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hacker news"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.new_releases), label: "News"),
          BottomNavigationBarItem(
            label: "Tops",
            icon: Icon(Icons.border_top),
          ),
          BottomNavigationBarItem(
            label: "Best",
            icon: Icon(Icons.vertical_align_top),
          )
        ],
        onTap: (value) {
          switch (value) {
            case 0:
              bloc.fetchStories(StoryType.NewStory);
              break;
            case 1:
              bloc.fetchStories(StoryType.TopStory);
              break;
            case 2:
              bloc.fetchStories(StoryType.BestStory);
          }
        },
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
