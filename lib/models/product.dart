import 'dart:convert';
import 'dart:ffi';
import 'package:shop_list/models/category.dart';



class Product {
    Product({
        this.id,
        required this.category,
        required this.name,
        this.quantity = 0,
        this.description = "",
    });

      String? id;
      final String name;
      String? description;
      final Category category;
      int? quantity;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        category: Category.fromMap(json["category"]),
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "category": category.toMap(),
        "name": name,
    };

      void updateDescription(String description){
    this.description = description;
  }
}

