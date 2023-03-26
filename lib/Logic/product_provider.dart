import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shop_list/models/product.dart';

import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  final List<Product> products = [];
  ProductProvider() {
    getAllProducts();
  }

  getAllProducts() async {
    final response = await http.get(Uri.https(
        "shoplist-bdb50-default-rtdb.firebaseio.com", "products.json"));
    final data = json.decode(response.body);
    data.forEach((key, value) {
      final p = Product.fromMap(value);
      p.id = key;
      products.add(p);
    });
    notifyListeners();
  }
}
