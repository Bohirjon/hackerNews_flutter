import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/abstractions/storyApiBase.dart';
import 'package:hacker_news/datas/story_type.dart';
import 'package:hacker_news/entities/itemModel.dart';
import 'package:rxdart/rxdart.dart';

class StoriesBloc {
  final _topStoriesId = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();
  final _itemsFetcher = PublishSubject<int>();

  final StoryApiBase storyApi;

  StoryType currentStoryType = StoryType.NewStory;

  Stream<List<int>> get topStoriesStream => _topStoriesId.stream;

  ValueStream<Map<int, Future<ItemModel>>> get items => _itemsOutput.stream;

  Function(int) get fetchItem => _itemsFetcher.sink.add;

  StoriesBloc({@required this.storyApi}) {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  void fetchStories(StoryType storyType) async {
    var ids = await storyApi.fetchIds(storyType);
    currentStoryType = storyType;
    _topStoriesId.sink.add(ids);
  }

  Future<ItemModel> getStory(int id) {
    return storyApi.getStory(id);
  }

  ScanStreamTransformer<int, Map<int, Future<ItemModel>>> _itemsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<ItemModel>> cache, int id, int index) {
        print(index);
        cache[id] = getStory(id);
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  void dispose() {
    _topStoriesId.close();
    _itemsOutput.close();
    _itemsFetcher.close();
  }
}
