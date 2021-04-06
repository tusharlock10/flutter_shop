import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' show Dio, BaseOptions;

import './Product.dart';
import '../dummy_data/Products.dart';

const BASE_URL = 'https://flutter-shop-2-default-rtdb.firebaseio.com/';
final httpClient = Dio(BaseOptions(baseUrl: BASE_URL));

class Products with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products {
    return [...this._products];
  }

  List<Product> get favouriteProducts {
    return _products.where((element) => element.isFavourite).toList();
  }

  Product findById(String? productId) {
    return this._products.firstWhere((product) => product.id == productId);
  }

  List<Product> _getProductsFromJson(String? json) {
    List<Product> products = [];
    if (json == null) {
      return products;
    }
    final Map<String, dynamic> productsMap = jsonDecode(json);
    productsMap.forEach((productId, productMap) {
      final product = Product.fromJson(productMap, productId: productId);
      products.add(product);
    });
    return products;
  }

  Future<void> fetchProducts() async {
    final response = await httpClient.get<String>('products.json');
    this._products = this._getProductsFromJson(response.data);
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    final response = await httpClient.post<String>('products.json',
        data: product.toJsonString());
    final String newId = jsonDecode(response.data!)['name'];
    this._products.add(Product.copyWith(product, newId: newId));
    notifyListeners();
  }

  Future<void> editProduct(Product productToEdit) async {
    await httpClient.patch<String>('products/${productToEdit.id}.json',
        data: productToEdit.toJsonString());
    this._products = this._products.map((product) {
      if (product.id == productToEdit.id) {
        return productToEdit;
      } else {
        return product;
      }
    }).toList();
    notifyListeners();
  }

  void removeProduct(Product productToRemove) {
    httpClient.delete<String>('products/${productToRemove.id}.json');
    this._products.removeWhere((product) => product.id == productToRemove.id);
    notifyListeners();
  }
}
