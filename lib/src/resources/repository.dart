import 'package:learnigo/src/models/item_model.dart';
import 'package:learnigo/src/resources/word_api_provider.dart';

class Repository {
  final translateApiProvider = TranslateApiProvider();

  Future<ItemModel> fetchTranslateText() => translateApiProvider.fetchTranslateText();
}
