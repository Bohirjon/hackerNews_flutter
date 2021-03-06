class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;

  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson["id"],
        deleted = parsedJson["deleted"] ?? false,
        type = parsedJson["type"],
        by = parsedJson["by"],
        time = parsedJson[""],
        text = parsedJson["text"] ?? "",
        dead = parsedJson["dead"] ?? false,
        parent = parsedJson["parent"],
        kids = parsedJson["kids"] ?? [],
        url = parsedJson["url"],
        score = parsedJson["score"],
        title = parsedJson["title"],
        descendants = parsedJson["descendants"];
}
