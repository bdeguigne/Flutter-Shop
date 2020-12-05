import 'dart:convert';

import 'package:flutter/material.dart';
import 'item.dart';
import 'navigation/navigation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'theme.dart';

Future<String> getJson() {
  return rootBundle.loadString('assets/json/data.json');
}

Future<List<Item>> getItems() async {
  var data = jsonDecode(await getJson()) as List;
  return data.map((itemJson) => Item.fromJson(itemJson)).toList();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Item> items = await getItems();
  runApp(MyApp(items: items));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key key, this.items}) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: appTheme,
      home: Navigation(items: items)
    );
  }
}