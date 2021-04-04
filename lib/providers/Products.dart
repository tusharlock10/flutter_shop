import 'package:flutter/material.dart';

import './Product.dart';
import '../dummy_data/Products.dart';

class Products with ChangeNotifier {
  List<Product> _products = PRODUCTS;

  List<Product> get products {
    return [...this._products];
  }

  List<Product> get favouriteProducts {
    return _products.where((element) => element.isFavourite).toList();
  }

  Product findById(int productId) {
    return this._products.firstWhere((product) => product.id == productId);
  }

  void addProduct(Product product) {
    this._products.add(Product.copyWith(product, newId: this._products.length+1));
    notifyListeners();
  }
}
