import 'package:flutter/material.dart';

import '../item.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: SafeArea(
            child: Text(item.name))
    );
  }
}
