import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:math' as Math;

import '../providers/Cart.dart' as CartProvider;
import '../widgets/CartItem.dart';

class Cart extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider.Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Container(
            child: Card(
              child: Text('${cart.cartTotal}'),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.count,
                itemBuilder: (context, index) {
                  final cartItem = cart.items[index];
                  return CartItem(cartItem);
                }),
          )
        ],
      ),
    );
  }
}
