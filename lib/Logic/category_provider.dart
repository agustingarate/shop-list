import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shop_list/models/category.dart';

import 'package:http/http.dart' as http;


class CategoryProvider extends ChangeNotifier {

  final List<Category> categories = [];

  CategoryProvider(){
    getAllCategories();
  }

  getAllCategories() async {
    final response = await http.get(Uri.https("shoplist-bdb50-default-rtdb.firebaseio.com", "categories.json"));
    final data = json.decode(response.body);
    data.forEach((key,value){
      final c = Category.fromMap(value);
      c.id = key;
      categories.add(c);
    });
    notifyListeners();
  }
}