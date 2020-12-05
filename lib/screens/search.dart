import 'package:flutter/material.dart';
import '../item.dart';

class Search extends StatelessWidget {
  const Search({Key key, this.items}) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
      return (Text("Search"));
  }
}
