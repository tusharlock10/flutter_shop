import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Products.dart';

import '../providers/Cart.dart';
import './Cart.dart' as CartScreen;
import '../widgets/ProductGrid.dart';
import '../widgets/AppDrawer.dart';

class ProductOverview extends StatefulWidget {
  static const routeName = '/';

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  bool showOnlyFavoutites = false;
  bool _isInit = true;
  bool _isLoading = false;

  @override
  didChangeDependencies() {
    if (this._isInit) {
      this.setState(() => this._isLoading = true);
      Provider.of<Products>(context)
          .fetchProducts()
          .then((_) => this.setState(() => this._isLoading = false));
      this._isInit = false;
    }
  }

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
      drawer: AppDrawer(),
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
      body: this._isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductGrid(showOnlyFavoutites: this.showOnlyFavoutites),
    );
  }
}
