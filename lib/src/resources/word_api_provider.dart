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

  Future<ItemModel> fetchTranslateText() async {
    print("entered");
    final response = await client
        .get("${_url}key=$_apiKey&text=car&lang=tr");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
