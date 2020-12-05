import 'package:flutter/material.dart';
import '../components/custom_tab_bar.dart';
import '../components/home_content.dart';
import '../item.dart';

class Home extends StatelessWidget {
  const Home({Key key, this.items}) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomTabBar(
        height: 100.0,
        labels: [
          "Games",
          "Hardware",
        ],
        widgets: [
          HomeContent(type: "game", items: items),
          HomeContent(type: "hardware", items: items),
        ],
        labelStyle: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat"
        ),
      ),
    );
  }
}
