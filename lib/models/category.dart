

import 'dart:convert';

class Category {

    Category({
        this.id,
        required this.title,
    });

    String? id;
    final String title;

    factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Category.fromMap(Map<String, dynamic> json) {
      print(json);
       return Category(
        id: json["id"],
        title: json["title"],
    );
    }

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
    };
}