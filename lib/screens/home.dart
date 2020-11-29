import 'package:flutter/material.dart';
import '../components/custom_tab_bar.dart';
import '../components/home_content.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: EdgeInsets.only(top: 16.0),
          child: CustomTabBar(
            height: 100.0,
            labels: [
              "Games",
              "Hardware",
            ],
            widgets: [
              HomeContent(type: "game"),
              HomeContent(type: "hardware"),
            ],
            labelStyle: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
                fontFamily: "Montserrat"
            ),
          )
      ),
    );
  }
}
