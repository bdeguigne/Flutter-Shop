import 'package:flutter/material.dart';
import 'custom_slide_img.dart';

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
