import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/utils/constants.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({Key key, @required this.label, this.rightLabel, this.onPressed}) : super(key: key);
  final String label;
  final String rightLabel;
  final void Function(String label) onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 35,
        child: Material(
            color: LightTheme.chipColor,
            borderRadius: BorderRadius.circular(5.0),
            child: InkWell(
              onTap: () => onPressed(label),
              splashColor: LightTheme.rippleColor,
              borderRadius: BorderRadius.circular(5.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 12.0, right: 12.0),
                child: Row(
                  children: [
                    Text(label),
                    rightLabel != null ? Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(rightLabel, style: TextStyle(color: LightTheme.secondaryTextColor),),
                    ) : Container(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
