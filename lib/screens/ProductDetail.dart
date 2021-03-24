import 'package:flutter/material.dart';

import '../models/Product.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/product';
  Product product;

  @override
  Widget build(BuildContext context) {
    this.product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(this.product.title),
      ),
      body: Column(
        children: [
          Image.network(this.product.imageUrl, fit: BoxFit.contain),
          Text(this.product.description),
        ],
      ),
    );
  }
}
