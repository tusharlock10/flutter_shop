import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

import '../providers/Cart.dart';
import './Cart.dart' as CartScreen;
import '../widgets/ProductGrid.dart';

class ProductOverview extends StatefulWidget {
  static const routeName = '/';

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  bool showOnlyFavoutites = false;

  onSelectValue(int value) {
    setState(() {
      if (value == 1) {
        showOnlyFavoutites = true;
      } else {
        showOnlyFavoutites = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              badgeContent: Text(
                '${cart.count}',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              child: child,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.Cart.routeName);
              },
            ),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: this.onSelectValue,
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text("Show All"),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text("Only Favourites"),
                  value: 1,
                ),
              ];
            },
          ),
        ],
      ),
      body: ProductGrid(showOnlyFavoutites: this.showOnlyFavoutites),
    );
  }
}
