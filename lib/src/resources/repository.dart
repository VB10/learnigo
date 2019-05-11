import 'package:learnigo/src/models/image_model.dart';
import 'package:learnigo/src/models/item_model.dart';
import 'package:learnigo/src/resources/english_api_provider.dart';
import 'package:learnigo/src/resources/image_api_provider.dart';
import 'package:learnigo/src/resources/word_api_provider.dart';

class Repository {
  final translateApiProvider = TranslateApiProvider();
  final imageApiProvider = ImageApiProvider();
  final englishApiProvider = EnglishApiProvider();

  Future<ItemModel> fetchTranslateText(String word) =>
      translateApiProvider.fetchTranslateText(word);
  Future<UnSplashModel> getImageWord(String word) =>
      imageApiProvider.getWordImage(word);
  String getEnglishWord(int index) => englishApiProvider.getEnglishWord(index);
}
