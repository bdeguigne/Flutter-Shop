import 'package:flutter/material.dart';
import 'custom_slide_img.dart';
import 'package:flutter_shop_app/components/game_list.dart';
import 'categories.dart';
import '../utils/constants.dart' as theme;

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
                SlideImg(),
                Text(
                  "All games",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                      fontSize: Theme.of(context).textTheme.headline5.fontSize,
                    ),
                  ),
                SizedBox(height: 8),
                Categories(),
                SizedBox(height: 8),
                GameList(height: 300)
              ],
            )
          ],
        )
        );
  }
}
