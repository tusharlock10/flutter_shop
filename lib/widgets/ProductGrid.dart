import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './ProductItem.dart';
import '../providers/Products.dart';

class ProductGrid extends StatelessWidget {
  final bool showOnlyFavoutites;

  const ProductGrid({
    Key? key,
    required this.showOnlyFavoutites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = this.showOnlyFavoutites
        ? productsData.favouriteProducts
        : productsData.products;
    return GridView.builder(
      itemCount: products.length,
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 4 / 3, crossAxisSpacing: 10),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: products[index], child: ProductItem()),
    );
  }
}
