import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_app_tuesday/services/apis.dart';

class AuthenticationSevice {
  Future<String?> signUp(String username, String password) async {
    final response = await http.post(Uri.parse(signUpApi),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'email': username,
          'password': password,
        },
        encoding: Encoding.getByName('utf-8'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
