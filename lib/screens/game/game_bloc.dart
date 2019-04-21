import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class GameBloc {
  StreamController<int> gameController = new StreamController<int>.broadcast();

  Future getWord() async {
    var db = FirebaseDatabase.instance;
    db
        .reference()
        .child("words")
        .limitToFirst(10)
        .once()
        .then((DataSnapshot snapShot) {
      print('Connect db ${snapShot.value}');
    }).catchError((error) {
      print("error-> ${error}");
    });
  }
}
