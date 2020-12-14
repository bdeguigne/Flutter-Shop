import 'package:flutter/material.dart';

class LightTheme {
  static const accentColor = Color(0xffff5248);

  /*  Background  */
  static const backgroundColor = Colors.white;
  static const secondaryBackgroundColor = Color(0xfff4f4f4);

  /* Text */
  static const textColor = Colors.black;
  static const secondaryTextColor = Color(0xffa5a5a5);
  static const unselectedLabelColor = Color(0xFFe5e5e5);
  static const placeholderColor = Color(0xFFCACACA);

  /* Cards */
  static const cardColor = Colors.white;
  static const chipColor = Color(0xffe8e8e8);

  /* Buttons */
  static const buttonColor = accentColor;
  static const buttonSecondaryColor = Color(0xfff5f5f5);

  /*  Navigation Bar  */
  static const navBarBackgroundColor = Color(0xff1d1d1d);
  static const unselectedItemColor = Color(0xff8e8e8e);

  /* Others */
  static const rippleColor = Color(0x80ff5248);
  static const searchBarColor = Colors.white;
  static const dividerColor = Color(0xFFD8D8D8);
}

class AppText {
  static const h1 = TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Montserrat",
      fontSize: 50
  );
}


