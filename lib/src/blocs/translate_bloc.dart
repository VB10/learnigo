import 'dart:math';

import 'package:learnigo/src/models/item_model.dart';
import 'package:learnigo/src/resources/repository.dart';
import 'package:learnigo/src/sqlite/SqliteManager.dart';
import 'package:rxdart/rxdart.dart';

class TranslateBloc {
  static const int MAX_ENGLISH_WORD = 5000;
  final _repository = Repository();
  final _wordFetcher = PublishSubject<ItemModel>();
  final databaseLocal = SqliteManager.instance;
  final Random randomNumberGenerate = new Random();

  Observable<ItemModel> get allTranslates => _wordFetcher.stream;

  fetchallTranslate(String word) async {
    ItemModel itemModel = await _repository.fetchTranslateText(word);
    _wordFetcher.sink.add(itemModel);
  }

  Future<String> getNewDataLibrary() async {
    String data = _repository.getEnglishWord();
    bool isAnswerData = await databaseLocal.queryIsTableHaveData(data);

    while (isAnswerData) {
      String data = _repository.getEnglishWord();
      isAnswerData = await databaseLocal.queryIsTableHaveData(data);
    }
    return data;
  }

  // call new english word  or user  didn't know word datas.
  Future getEnglishWord(int index) async {
    int allCount = await databaseLocal.queryRowAllCount();
    //check max english word.
    if (allCount == MAX_ENGLISH_WORD)
      return "End Game";
    else {
      String data = _repository.getEnglishWord();
      var localData = await databaseLocal.queryRowListKnowDatas(true);
      if (localData.length == 0) {
        data = await getNewDataLibrary();
      }
      localData.add(data);
      return localData[randomNumberGenerate.nextInt(localData.length)];
    }
  }

  void dispose() {
    _wordFetcher.close();
  }
}

final bloc = TranslateBloc();
