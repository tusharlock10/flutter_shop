import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavourite = false,
  });

  Product.copyWith(Product product,
      {String? newId,
      String? newTitle,
      String? newDescription,
      double? newPrice,
      String? newimageUrl,
      bool? newIsFavourite = false})
      : id = newId ?? product.id,
        title = newTitle ?? product.title,
        description = newDescription ?? product.description,
        price = newPrice ?? product.price,
        imageUrl = newimageUrl ?? product.imageUrl,
        isFavourite = newIsFavourite ?? product.isFavourite;

  Product.fromJson(Map<String, dynamic> productMap, {String? productId})
      : id = productId ?? productMap['id'],
        title = productMap['title'],
        description = productMap['description'],
        price = productMap['price'],
        imageUrl = productMap['imageUrl'],
        isFavourite = productMap['isFavourite'];

  Map toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'price': this.price,
      'imageUrl': this.imageUrl,
      'isFavourite': this.isFavourite,
    };
  }

  String toJsonString() {
    return jsonEncode(this);
  }

  @override
  String toString() {
    return """
Id : ${this.id}
Title : ${this.title}
Price : ${this.price}
Description : ${this.description}
ImageUrl : ${this.imageUrl}
IsFavourite  : ${this.isFavourite}
""";
  }

  void toggleFavouriteStatus() {
    this.isFavourite = !this.isFavourite;
    notifyListeners();
  }
}
