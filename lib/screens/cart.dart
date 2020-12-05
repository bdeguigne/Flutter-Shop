import 'package:flutter/material.dart';
import '../item.dart';

class Cart extends StatelessWidget {
  const Cart({Key key, this.items}) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart")
      ),
      body: Text("Carting"),
    );
  }
}
