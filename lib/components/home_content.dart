import 'package:flutter/material.dart';

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
        child: Text(
          "Featured",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Theme.of(context).textTheme.headline5.fontSize),
        )
    );
  }
}
