import 'package:flutter/foundation.dart';
import 'Product.dart';

class CartItem {
  final int id;
  final Product product;
  final int quantity;
  final double totalPrice;

  CartItem({
    @required this.id,
    @required this.product,
    @required this.quantity,
    @required this.totalPrice,
  });
}

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items {
    return [...this._items];
  }

  int get count {
    return this._items.length;
  }

  addItem(Product product) {
    final productIndex = _items.indexWhere((item) => item.product.id == product.id);
    if (productIndex < 0) {
      // if product is not present, then add it in the cart
      this._items.add(
            CartItem(
              id: _items.length,
              product: product,
              quantity: 1,
              totalPrice: product.price,
            ),
          );
    } else {
      final cartItem = this._items[productIndex];
      final newCartItem = CartItem(
        id: cartItem.id,
        quantity: cartItem.quantity + 1,
        product: cartItem.product,
        totalPrice: cartItem.totalPrice + cartItem.product.price,
      );
      this._items[productIndex] = newCartItem;
    }
    notifyListeners();
  }
}
