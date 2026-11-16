import 'package:http/http.dart' as http;

class JsonAcceptClient extends http.BaseClient {
  JsonAcceptClient(this._inner);

  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return _inner.send(request);
  }
}
