import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_shop_app/components/game_list_item.dart';
import '../item.dart';

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  List<Item> _items;

  Future<String> _getJson() {
    return rootBundle.loadString('assets/json/data.json');
  }

  _storeItems() async {
    print('OKAY');
    var data = jsonDecode(await _getJson()) as List;
    setState(() {
      _items = data.map((itemJson) => Item.fromJson(itemJson)).toList();
    });
  }

  @override
  void initState() {
    super.initState();

    _storeItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return GameListItem(
              item: _items[index]
            );
          },
      )
    );
  }
}
