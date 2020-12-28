import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/components/genre_layout.dart';
import 'package:flutter_shop_app/item.dart';
import '../utils/constants.dart' as theme;

class GameListItem extends StatelessWidget {
  const GameListItem(
      {Key key,
      @required this.item,
      this.onTap,
      this.padding,
      this.showCategories = true,
      this.height = 100.0,
      this.style = "list"})
      : super(key: key);

  final Item item;
  final EdgeInsetsGeometry padding;
  final void Function(Item tapedItem) onTap;
  final bool showCategories;
  final double height;
  final String style;

  Widget content() {
    return Container(
        margin: style == "list" ? padding : EdgeInsets.all(4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/card_placeholder.png',
                  image: item.thumbnail,
                  height: height,
                  width: 120,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 500),
                )),
            Flexible(
                child: Container(
                    height: height,
                    margin: EdgeInsets.only(left: 12),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 4),
                            if (item.isPromo == true)
                              (Row(
                                children: [
                                  Text(
                                    '\$${item.price}',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w500,
                                        color: theme
                                            .LightTheme.secondaryTextColor),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '\$${item.newPrice}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: theme.LightTheme.buttonColor),
                                  ),
                                ],
                              ))
                            else
                              (Row(
                                children: [
                                  Text(
                                    '\$${item.price}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: theme.LightTheme.buttonColor),
                                  ),
                                ],
                              )),
                            if (showCategories == true)
                              Expanded(
                                child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: GenreLayout(
                                      genres: item.category,
                                      maxItems: 2,
                                    )),
                              )
                          ]),
                    )))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    if (onTap != null && style == "card") {
      return Container(
        margin: padding,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ]),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          child: InkWell(
              borderRadius: BorderRadius.circular(5.0),
              splashColor: theme.LightTheme.rippleColor,
              onTap: () => onTap(item),
              child: content()),
        ),
      );
    } else if (onTap != null && style == "list") {
      return InkWell(
          splashColor: theme.LightTheme.rippleColor,
          onTap: () => onTap(item),
          child: content());
    } else if (style == "card") {
      return Container(
        margin: padding,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ]),
        child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            child: content()),
      );
    } else {
      return content();
    }
  }
}
