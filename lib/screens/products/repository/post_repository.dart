import 'dart:convert';

import 'package:bloc_app/constants/app_constants.dart';
import 'package:bloc_app/screens/products/model/product.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<Products>> fetchProduct() async {
    final response = await http.get(Uri.parse(AppConstants.base_url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final product = Product.fromJson(jsonResponse);
      print(jsonResponse.toString());
      return product.products ?? []; // returns List<Products>
    } else {
      throw Exception("Failed to load products");
    }
  }
}
