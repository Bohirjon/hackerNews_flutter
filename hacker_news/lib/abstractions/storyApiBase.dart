import 'package:hacker_news/datas/story_type.dart';
import 'package:hacker_news/entities/itemModel.dart';

abstract class StoryApiBase {
  Future<List<int>> fetchIds(StoryType storyType);

  Future<ItemModel> getStory(int id);
}
