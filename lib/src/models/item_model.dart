class ItemModel {
  String _word;
  String _code;
  String _lang;

  List<String> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    // print(parsedJson['results'].length);
    _code = parsedJson["code"].toString();
    _lang = parsedJson["lang"];
    List<String> temp = [];
    for (int i = 0; i < parsedJson['text'].length; i++) {
      String result = parsedJson['text'][i].toString();
      temp.add(result);
    }
    _results = temp;
  }

  List<String> get results => _results;
  String get code => _code;
  String get lang => _lang;
}
