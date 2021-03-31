import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Cart.dart' as CartProvider;

class Cart extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider.Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: cart.count,
          itemBuilder: (context, index) {
            final cartItem = cart.items[index];
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('${cartItem.product.title}'),
                  Text('${cartItem.quantity}'),
                ],
              ),
            );
          }),
    );
  }
}
