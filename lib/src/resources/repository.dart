import 'package:learnigo/src/models/image_model.dart';
import 'package:learnigo/src/models/item_model.dart';
import 'package:learnigo/src/resources/image_api_provider.dart';
import 'package:learnigo/src/resources/word_api_provider.dart';

class Repository {
  final translateApiProvider = TranslateApiProvider();
  final imageApiProvider = ImageApiProvider();

  Future<ItemModel> fetchTranslateText(String word) =>
      translateApiProvider.fetchTranslateText(word);
  Future<UnSplashModel> getImageWord(String word) =>
      imageApiProvider.getWordImage(word);
}
