import 'package:learnigo/src/models/item_model.dart';
import 'package:learnigo/src/resources/key.dart';
import 'package:learnigo/src/resources/word_api_provider.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

final _apiKey = key;
final _lang = 'tr';
final _url = 'https://translate.yandex.net/api/v1.5/tr.json/translate?';
main() {
  group('fetchPost', () {
    test('returns yandex api translate tr', () async {
      final client = TranslateApiProvider();
      final last = await client.fetchTranslateText("car");
      expect(last.results[0], "araba");
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final word = "car";
      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      // client.post("url")
//TODO MOCK CLIENT FIX IT !
      when(client.get("${_url}key=$_apiKey&text=$word&lang=$_lang"))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      // when(client.get("${_url}key=$_apiKey&text=$word&lang=tr"))
      //     .thenAnswer((res) async {
      //   print(res);
      //   return http.Response('Not Found', 200);
      // });

      // expect(fetchPost(client), throwsException);
    });
  });
}
