import 'package:flutter/material.dart';
import 'package:hacker_news/blocs/topStoriesBloc.dart';
import 'package:hacker_news/entities/itemModel.dart';

class StoriesTile extends StatelessWidget {
  final TopStoriesBloc bloc;
  final int itemId;
  StoriesTile({this.bloc, this.itemId});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<int, Future<ItemModel>>>(
      stream: bloc.items,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FutureBuilder<ItemModel>(
            future: snapshot.data[itemId],
            builder: (context, itemSnapshot) {
              if (itemSnapshot.hasData) {
                return ListTile(
                  title: Text(itemSnapshot.data.title),
                );
              }
              return Text("Loading Item");
            },
          );
        }
        return Text("Loading...");
      },
    );
  }
}
