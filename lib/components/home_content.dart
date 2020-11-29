import 'package:flutter/material.dart';
import 'package:flutter_shop_app/components/game_list.dart';
import 'categories.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({this.type});
  final String type;

  @override
  _SearchGamesState createState() => _SearchGamesState();
}

class _SearchGamesState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Categories(),
                SizedBox(height: 16),
                GameList()
              ],
            )
          ],
        )
        );
  }
}
