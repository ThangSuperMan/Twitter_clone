import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseURL = 'http://localhost:3000';

class BaseClient {
  var client = http.Client();

  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseURL + api);
    var _headers = {'Authoriazation': 'Bearer sfi'};

    var response = await client.get(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseURL + api);

    // var _headers = {'Authoriazation': 'Bearer sfi'};
    var _payload = json.encode(object);
    var response = await client.post(url, body: _payload);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {}
  }
}
