import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart();

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
