import 'package:learnigo/src/models/image_model.dart';
import 'package:learnigo/src/models/item_model.dart';
import 'package:learnigo/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class TranslateBloc {
  final _repository = Repository();
  final _wordFetcher = PublishSubject<ItemModel>();
  final _wordEnglish = PublishSubject<String>();

  Observable<ItemModel> get allTranslates => _wordFetcher.stream;
  Observable<String> get getWord => _wordEnglish.stream;

  fetchallTranslate(String word) async {
    ItemModel itemModel = await _repository.fetchTranslateText(word);
    _wordFetcher.sink.add(itemModel);
  }

  getEnglishWord(int index) {
    String data = _repository.getEnglishWord(index);
    _wordEnglish.sink.add(data);
  }

  void dispose() {
    _wordFetcher.close();
    _wordEnglish.close();
  }
}

final bloc = TranslateBloc();
