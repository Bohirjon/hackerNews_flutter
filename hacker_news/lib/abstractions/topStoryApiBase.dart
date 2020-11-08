import 'package:hacker_news/entities/itemModel.dart';

abstract class TopStoryApiBase {
  Future<List<int>> fetchIds();

  Future<ItemModel> getStory(int id);
}
