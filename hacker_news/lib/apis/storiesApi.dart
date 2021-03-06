import 'dart:convert';
import 'package:hacker_news/abstractions/storyApiBase.dart';
import 'package:hacker_news/datas/story_type.dart';
import 'package:hacker_news/entities/itemModel.dart';
import '../apis/apisEndpoints.dart';
import 'package:http/http.dart' as http;
import '../extensions/story_typeExtensions.dart';

class StoryApi implements StoryApiBase {
  Future<List<int>> fetchIds(StoryType storyType) async {
    var url = StoriesEndpoint.replaceFirst("replacement", storyType.uri);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var ids = json.decode(response.body) as List<dynamic>;
      return ids.cast<int>();
    }
    return List.empty();
  }

  Future<ItemModel> getStory(int id) async {
    var url = GetStoryEndpoint.replaceFirst("replacement", id.toString());
    var response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        var jsonValue = json.decode(response.body);
        var itemModel = ItemModel.fromJson(jsonValue);
        return itemModel;
      } catch (Exception) {
        return null;
      }
    }
    return null;
  }
}
