import 'package:flutter/cupertino.dart';
import 'package:hacker_news/apis/topStoriesApi.dart';
import 'package:hacker_news/blocs/topStoriesBloc.dart';

class TopStoriesProvider extends InheritedWidget {
  final TopStoriesBloc bloc;

  TopStoriesProvider({Key key, Widget child})
      : bloc = TopStoriesBloc(topStoryApi: TopStoryApi()),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static TopStoriesBloc of(BuildContext context) {
    var provider =
        context.getElementForInheritedWidgetOfExactType<TopStoriesProvider>()
            as TopStoriesProvider;
    return provider.bloc;
  }
}
