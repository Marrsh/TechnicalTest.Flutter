import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";

  get({required String endpoint}) async {
    try {
      var request = http.get(Uri.parse(_baseUrl + endpoint));
      return _requestHandler(request);
    } catch (e) {
      // TODO:: log error
    }
  }

  _requestHandler(request) async {
    late http.Response response;

    response = await request;

    debugPrint(response.body);

    return response;
  }
}
