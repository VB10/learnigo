import 'package:learnigo/src/models/item_model.dart';
import 'package:learnigo/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class TranslateBloc {
  final _repository = Repository();
  final _wordFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allTranslates => _wordFetcher.stream;

  fetchallTranslate(String word) async {
    ItemModel itemModel = await _repository.fetchTranslateText(word);
    _wordFetcher.sink.add(itemModel);
  }

  getEnglishWord(int index) {
    String data = _repository.getEnglishWord(index);
    return data;
  }

  void dispose() {
    _wordFetcher.close();
  }
}

final bloc = TranslateBloc();
