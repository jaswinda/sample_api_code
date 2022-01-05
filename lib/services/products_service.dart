import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_app_tuesday/services/apis.dart';

class ProductService {
  Future<String?> getProducts() async {
    final response = await http.post(Uri.parse(productsApi),
        headers: {
          'Accept': 'application/json',
        },
        encoding: Encoding.getByName('utf-8'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
