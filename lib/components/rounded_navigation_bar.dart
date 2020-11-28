import 'package:flutter/material.dart';

class RoundedBottomNavigationBar extends StatelessWidget {
  RoundedBottomNavigationBar({this.bottomNavigationBar, this.borderRadius});

  final Widget bottomNavigationBar;
  final double borderRadius;

  // Rajouter un argument pour la couleur //

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(borderRadius), topLeft: Radius.circular(borderRadius)),
          boxShadow: [
            BoxShadow(
                color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
          child: bottomNavigationBar
        )
    );
  }
}
