import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Products.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/product';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<Products>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title!),
      ),
      body: Column(
        children: [
          Image.network(product.imageUrl!, fit: BoxFit.contain),
          Text(product.description!),
        ],
      ),
    );
  }
}
