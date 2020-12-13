import 'package:flutter/material.dart';
import 'package:flutter_shop_app/utils/constants.dart';

final ThemeData appTheme = _theme();

ThemeData _theme() {

  return ThemeData(
    primaryColor: Colors.white,
    accentColor: LightTheme.accentColor,
    splashColor: LightTheme.rippleColor,
    fontFamily: "Montserrat",
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black
      )
  );
}
