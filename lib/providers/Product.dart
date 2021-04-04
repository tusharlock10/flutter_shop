import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavourite = false,
  });

  Product.copyWith(Product product,
      {int newId,
      String newTitle,
      String newDescription,
      double newPrice,
      String newimageUrl,
      bool newIsFavourite})
      : id = newId != null ? newId : product.id,
        title = newTitle != null ? newTitle : product.title,
        description =
            newDescription != null ? newDescription : product.description,
        price = newPrice != null ? newPrice : product.price,
        imageUrl = newimageUrl != null ? newimageUrl : product.imageUrl,
        isFavourite = newIsFavourite != null
            ? newIsFavourite
            : product.isFavourite != null
                ? product.isFavourite
                : false;

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
