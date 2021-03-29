import 'package:flutter/material.dart';

import './Product.dart';
import '../dummy_data/Products.dart';

class Products with ChangeNotifier {
  List<Product> _products = PRODUCTS;

  List<Product> get products {
    return [...this._products];
  }

  Product findById(int productId) {
    return this._products.firstWhere((product) => product.id == productId);
  }
}