import 'package:flutter/material.dart';
import 'package:flutter_shop_app/utils/constants.dart';

class RoundedIconWithText extends StatelessWidget {
  const RoundedIconWithText({Key key, this.text, this.icon, this.onTap}) : super(key: key);

  final String text;
  final Icon icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(80, 80), // button width and height
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor:
            LightTheme.rippleColor, // splash color
            onTap: onTap, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                Text(text,
                    style: TextStyle(fontSize: 14)
                ), // text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
