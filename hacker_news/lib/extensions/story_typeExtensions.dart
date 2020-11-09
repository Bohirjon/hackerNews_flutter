import 'package:hacker_news/datas/story_type.dart';

extension StoryToStrings on StoryType {
  String get uri {
    switch (this) {
      case StoryType.NewStory:
        return "newstories";
        break;
      case StoryType.TopStory:
        return "topstories";
        break;
      case StoryType.BestStory:
        return "beststories";
        break;
      default:
        throw FormatException("Un known story type");
    }
  }
}
