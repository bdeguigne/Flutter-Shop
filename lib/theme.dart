import 'package:flutter/material.dart';
import 'package:flutter_shop_app/utils/constants.dart';
import 'utils/hex_color.dart';

final ThemeData appTheme = _theme();

ThemeData _theme() {

  return ThemeData(
    primaryColor: Colors.white,
    accentColor: LightTheme.accentColor,
    fontFamily: "Montserrat",
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black
      )
  );
}
