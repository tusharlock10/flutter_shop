import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Cart.dart' as CartProvider;

class CartItem extends StatelessWidget {
  final CartProvider.CartItem cartItem;

  CartItem(this.cartItem);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider.Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => cart.removeItem(this.cartItem.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 20,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('${this.cartItem.product.title}'),
              Text('${this.cartItem.quantity}'),
              Text('\$${this.cartItem.totalPrice.round()}'),
            ],
          ),
        ),
      ),
    );
  }
}
