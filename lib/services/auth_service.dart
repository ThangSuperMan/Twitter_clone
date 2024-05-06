import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_clone/services/global_service.dart';

const String baseUrl = 'http://localhost:3000';

class AuthService {
  static const String _tokenKey = 'token';

  static Future<void> login(String email, String password) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };

      var response = await http.post(Uri.parse('$baseUrl /api/v1/login'),
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        String token = jsonResponse['metadata']['token'] as String;
        String email = jsonResponse['metadata']['email'] as String;
        String fullName = jsonResponse['metadata']['full_name'] as String;
        int userId = jsonResponse['metadata']['user_id'] as int;

        Map<String, dynamic> userInfo = {
          "user_id": userId,
          "email": email,
          "full_name": fullName,
          "token": token
        };

        print("userInfo: $userInfo");

        await GlobalService.storeUserLoggedInInfo(userInfo);
        print('Token: $token');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  static Future<void> storeToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }
}
