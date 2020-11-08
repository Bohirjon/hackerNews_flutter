import 'package:hacker_news/abstractions/topStoryApiBase.dart';
import 'package:hacker_news/entities/itemModel.dart';
import 'package:rxdart/rxdart.dart';

class TopStoriesBloc {
  final _topStoriesId = PublishSubject<List<int>>();
  final _items = BehaviorSubject<int>();
  final TopStoryApiBase topStoryApi;

  Stream<List<int>> get topStoriesStream => _topStoriesId.stream;

  Function(int) get fetchItem => _items.sink.add;

  TopStoriesBloc({this.topStoryApi});

  void fetchTopStories() async {
    var ids = await topStoryApi.fetchIds();
    _topStoriesId.sink.add(ids);
  }

  Future<ItemModel> getStory(int id) {
    return topStoryApi.getStory(id);
  }

  ScanStreamTransformer<int, Map<int, Future<ItemModel>>> _itemsTransformer() {
    var asd = ScanStreamTransformer(
      (Map<int, Future<ItemModel>> cache, int id, _) {
        cache[id] = getStory(id);
      },
      <int, Future<ItemModel>>{},
    );
  }

  void dispose() {
    _topStoriesId.close();
    _items.close();
  }
}
