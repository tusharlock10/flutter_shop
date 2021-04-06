import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Products.dart';
import '../widgets/UserProductItem.dart';
import './EditProduct.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user/products';

  Future<void> onRefresh(BuildContext context) async {
    return Provider.of<Products>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Products'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () =>
                  Navigator.of(context).pushNamed(EditProductScreen.routeName)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => this.onRefresh(context),
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (_, index) => Column(
                      children: [UserProductItem(products[index]), Divider()])),
            ),
          ),
        ],
      ),
    );
  }
}
