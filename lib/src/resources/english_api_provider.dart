import 'package:english_words/english_words.dart';

class EnglishApiProvider {
  final wordPairs = generateWordPairs();
  String getEnglishWord(int index) {
    return wordPairs.elementAt(0).first;
  }
}
