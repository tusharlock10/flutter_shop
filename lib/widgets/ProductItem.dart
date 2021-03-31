import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/ProductDetail.dart';
import '../providers/Product.dart';
import '../providers/Cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    return GridTile(
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetail.routeName, arguments: product.id);
        },
        child: Container(
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.grey.withOpacity(0.5),
        leading: IconButton(
            icon: Icon(
              product.isFavourite ? Icons.favorite : Icons.favorite_outline,
              color: product.isFavourite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              product.toggleFavouriteStatus();
            }),
        title: Text(
          '${product.title}',
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
          cart.addItem(product);
        }),
      ),
    );
  }
}
