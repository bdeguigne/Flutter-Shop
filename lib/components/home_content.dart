import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'custom_slide_img.dart';
=======
import 'package:flutter_shop_app/components/game_list.dart';
import 'categories.dart';
>>>>>>> dbbaa251026f19a4dcc0b928b4a2aaeb3ef4a6f0

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
                SizedBox(height: 16),
              ]
            )
          ],
        )
        );
  }
}
