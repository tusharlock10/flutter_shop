import 'package:flutter/material.dart';

import '../widgets/ProductItem.dart';
import '../dummy_data/Products.dart';

class ProductOverview extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: GridView.builder(
        itemCount: PRODUCTS.length,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 4 / 3, crossAxisSpacing: 10),
        itemBuilder: (context, index) => ProductItem(PRODUCTS[index]),
      ),
    );
  }
}
