import 'package:flutter/material.dart';

import '../screens/ProductDetail.dart';
import '../models/Product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: InkWell(
        onTap: (){Navigator.of(context).pushNamed(ProductDetail.routeName, arguments: product);},
              child: Container(
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.grey.withOpacity(0.5),
        leading:
            IconButton(icon: Icon(Icons.favorite_outline), onPressed: () {}),
        title: Text(
          '${product.title}',
          textAlign: TextAlign.center,
        ),
        trailing:
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
      ),
    );
  }
}
