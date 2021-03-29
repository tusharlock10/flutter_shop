import 'package:flutter/material.dart';



class Orders extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders'),),
    );
  }
}