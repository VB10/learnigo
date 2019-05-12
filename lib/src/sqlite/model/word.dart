import 'package:learnigo/src/sqlite/SqliteManager.dart';

final String columnId = 'id';
final String columnWord = 'word';
final String columnKnow = 'know';

class UserWordInformation {
  int id;
  String word;
  int know;

  List<UserWordInformation> objectList;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SqliteManager.columnName: word,
      SqliteManager.columnKnow: know
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  UserWordInformation();

  UserWordInformation.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    word = map[columnWord];
    know = map[columnKnow];
  }

  UserWordInformation.fromListMap(List<Map<String, dynamic>> list) {
    objectList = new List<UserWordInformation>();
    objectList = list.map((item) {
      var model = UserWordInformation();
      model.id = item[columnId];
      model.word = item[columnWord];
      model.know = item[columnKnow];
      return model;
    }).toList();
  }
}
