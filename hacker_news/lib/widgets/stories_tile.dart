import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/blocs/storiesBloc.dart';
import 'package:hacker_news/entities/itemModel.dart';
import 'package:provider/provider.dart';

class StoriesTile extends StatelessWidget {
  final int itemId;

  StoriesTile({this.itemId});

  @override
  Widget build(BuildContext context) {
    final StoriesBloc bloc = Provider.of<StoriesBloc>(context);
    return StreamBuilder<Map<int, Future<ItemModel>>>(
      stream: bloc.items,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FutureBuilder<ItemModel>(
            future: snapshot.data[itemId],
            builder: (context, itemSnapshot) {
              if (itemSnapshot.hasData) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(itemSnapshot.data.title),
                      subtitle:
                          Text(itemSnapshot.data.score.toString() + " votes"),
                      trailing: Column(
                        children: [
                          Icon(Icons.comment),
                          Text(itemSnapshot.data.kids.length.toString())
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                );
              }
              return buildLoadingTile();
            },
          );
        }
        return buildLoadingTile();
      },
    );
  }

  Widget buildLoadingTile() {
    return Column(
      children: [
        ListTile(
          title: Container(
            height: 24.0,
            color: Colors.grey.shade200,
          ),
          subtitle: Container(
            color: Colors.grey.shade200,
            height: 24.0,
          ),
        ),
        Divider(),
      ],
    );
  }
}
