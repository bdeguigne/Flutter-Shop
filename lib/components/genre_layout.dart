import 'package:flutter/material.dart';
import '../utils/constants.dart';

class GenreLayout extends StatelessWidget {
  const GenreLayout({Key key, this.genres, this.maxItems = 10, this.textSize = 12}) : super(key: key);

  final List<String> genres;
  final int maxItems;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: genres.map((genre) {
        var index = genres.indexOf(genre);
        if (maxItems != null && index < maxItems) {
          return Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: LightTheme.secondaryTextColor)),
              child: Text(
                genre.toUpperCase(),
                style: TextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.w500,
                    color: LightTheme.secondaryTextColor),
              ),
            ),
          );
        } else {
          return Container();
        }
      }).toList(),
    );
  }
}
