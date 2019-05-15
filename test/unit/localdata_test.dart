import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnigo/src/sqlite/SqliteManager.dart';
import 'package:learnigo/src/sqlite/model/word.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  final dbHelper = SqliteManager.instance;
  final word = "car";
  final List<MethodCall> log = <MethodCall>[];
  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/path_provider');
  String response;

  tearDown(() {
    log.clear();
  });

  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    log.add(methodCall);
    return response;
  });
  test('user save data', () async {
    var response = null;
    final String fakePath = "/foo/bar/baz";
    response = fakePath;
    final Directory directory = await getApplicationDocumentsDirectory();
    final model = UserWordInformation();
    model.word = word;
    model.know = 1;
    final result = await dbHelper.insert(model.toMap());
    expect(result, 1);
  });
}
