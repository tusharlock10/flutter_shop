import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Product.dart';

import '../providers/Products.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/product';
  int productId;

  @override
  Widget build(BuildContext context) {
    this.productId = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<Products>(context).findById(this.productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: [
          Image.network(product.imageUrl, fit: BoxFit.contain),
          Text(product.description),
        ],
      ),
    );
  }
}
