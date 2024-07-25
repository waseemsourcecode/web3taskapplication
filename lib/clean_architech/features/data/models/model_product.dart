// To parse this JSON data, do
//
//     final modelProduct = modelProductFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ModelProduct> modelProductFromJson(String str) => List<ModelProduct>.from(json.decode(str).map((x) => ModelProduct.fromJson(x)));

String modelProductToJson(List<ModelProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelProduct {
    int id;
    String title;
    double price;
    String description;
   // Category category;
    String image; 

    ModelProduct({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
      //  required this.category,
        required this.image,
       
    });

    factory ModelProduct.fromJson(Map<String, dynamic> json) => ModelProduct(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
      //  category: categoryValues.map[json["category"]],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        //"category": categoryValues.reverse[category],
        "image": image,
    };
}

enum Category {
    ELECTRONICS,
    JEWELERY,
    MEN_S_CLOTHING,
    WOMEN_S_CLOTHING
}

final categoryValues = EnumValues({
    "electronics": Category.ELECTRONICS,
    "jewelery": Category.JEWELERY,
    "men's clothing": Category.MEN_S_CLOTHING,
    "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
    double rate;
    int count;

    Rating({
        required this.rate,
        required this.count,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
