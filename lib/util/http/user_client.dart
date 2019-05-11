import 'package:http/http.dart';

class UserClient extends BaseClient {
  final List<Map<String, String>> headers;
  final Client _inner;

  UserClient(this.headers, this._inner);

  Future<StreamedResponse> send(BaseRequest request) {
    for (var item in headers) {
      request.headers.addAll(item);
    }
    print(headers);
    return _inner.send(request);
  }
}
