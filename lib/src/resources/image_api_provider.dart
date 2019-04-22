import 'dart:async';
import 'package:http/http.dart';
import 'package:learnigo/src/models/image_model.dart';
import 'dart:convert';
import './key.dart';

class ImageApiProvider {
  Client client;

  ImageApiProvider() {
    client = new Client();
  }
  final _apiKey = key;
  final _page = 'page=1';
  final _query = 'query';
  final _per_page = 'per_page=1';
  final _url = 'https://api.unsplash.com/search/photos?';

  Future<UnSplashModel> getWordImage(String word) async {
    print(word);
    String url =
        "${_url}" + "$_page" + "&" + "$_query=$word" + "&" + "$_per_page";

    final response = await client.get(url, headers: header);

    switch (response.statusCode) {
      case 200:
        return UnSplashModel.fromJson(json.decode(response.body));
        break;
      default:
        throw Exception('Failed to load post');
    }
  }
}
