import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'utils/hex_color.dart';

final ThemeData appTheme = _theme();

ThemeData _theme() {

  return ThemeData(
    primaryColor: Colors.white,
    accentColor: HexColor.fromHex("#ff5248"),
    fontFamily: "Montserrat",
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black
      )
  );
}
