import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';
import './key.dart';

class TranslateApiProvider {
  Client client = Client();
  final _apiKey = key;
  final _lang = 'tr';
  final _url = 'https://translate.yandex.net/api/v1.5/tr.json/translate?';

  Future<ItemModel> fetchTranslateText(String word) async {
    final response = await client.get("${_url}key=$_apiKey&text=$word&lang=tr");
    switch (response.statusCode) {
      case 200:
        return ItemModel.fromJson(json.decode(response.body));
        break;
      default:
        throw Exception('Failed to load post');
    }
  }
}
