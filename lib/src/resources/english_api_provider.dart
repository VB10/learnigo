import 'package:english_words/english_words.dart';

class EnglishApiProvider {
  final wordPairs = generateWordPairs(safeOnly: false,maxSyllables: 3);
  String getEnglishWord(int index) {
    return wordPairs.elementAt(0).first;
  }
}
