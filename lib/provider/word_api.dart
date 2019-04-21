import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learnigo/utilty/url.dart';
import 'package:firebase_database/firebase_database.dart';

class WordApiProvider {
  Dio _dio;

  WordApiProvider() {
    _dio = Dio();
  }

  Future getWord() async {
    var db = FirebaseDatabase.instance;
    db.reference().child("words").limitToFirst(10).once().then((DataSnapshot snapShot) {
      print('Connect db ${snapShot.value}');
    }).catchError((error) {
      print("error-> ${error}");
    });
  }
}
