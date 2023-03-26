import 'package:flutter/material.dart';

import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _productsInList = [];
  List<Product> get productsInList => _productsInList;

  void addProducts(Product p) {
    _productsInList.add(p);
    notifyListeners();
  }

  void removeProduct(Product p) {
    _productsInList.remove(p);
    notifyListeners();
  }

  void updateDescription(String description, Product product) {
    product.description = description;
    notifyListeners();
  }

  void updateQuantity(int number, Product product) {
    product.quantity = number;
    notifyListeners();
  }
}
