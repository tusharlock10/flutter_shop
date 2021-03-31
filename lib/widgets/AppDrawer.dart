import 'package:flutter/material.dart';

import '../screens/ProductsOverview.dart';
import '../screens/Cart.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Orders'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Products'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ProductOverview.routeName),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            onTap: () =>
                Navigator.of(context).pushNamed(Cart.routeName),
          ),
        ],
      ),
    );
  }
}
