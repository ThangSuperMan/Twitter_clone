import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class GlobalService {
  static const String _currentUserKey = 'current_user';

  static Future<void> storeUserLoggedInInfo(Map<String, dynamic> user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentUserKey, jsonEncode(user));
  }

  static Future<Map<String, dynamic>?> getUserLoggedInInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userJson = prefs.getString(_currentUserKey);
    if (userJson != null) {
      return jsonDecode(userJson);
    }
    return null;
  }
}
