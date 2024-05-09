import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twitter_clone/services/global_service.dart';

const String baseURL = 'http://localhost:3000';

class BaseClient {
  var client = http.Client();

  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseURL + api);
    print("url: $url");
    var headers = {'Authoriazation': 'Bearer sfi'};

    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseURL + api);

    Map<String, dynamic>? userInfo = await GlobalService.getUserLoggedInInfo();
    String token = userInfo?['token'];
    print("url: $url");
    print("token inside: $token");

    var header = {'Authorization': token};

    var payload = json.encode(object);
    var response = await client.post(url, headers: header, body: payload);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {}
  }
}
