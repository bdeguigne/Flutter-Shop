import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/item.dart';
import '../utils/constants.dart' as theme;

class GameListItem extends StatelessWidget {
  const GameListItem({Key key, this.item, this.onTap}) : super(key: key);

  final Item item;
  final void Function(Item tapedItem) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: theme.LightTheme.rippleColor,
      onTap: () => onTap(item),
      child: Container(
          margin: EdgeInsets.only(bottom: 8.0, top: 8.0, left: 16.0, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/card_placeholder.png',
                  image: item.thumbnail,
                  height: 100,
                  width: 120,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 500),
                )
              ),
              Flexible(
                  child: Container(
                      height: 100,
                      margin: EdgeInsets.only(left: 12),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                        decoration:
                                            TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            theme.LightTheme.secondaryTextColor),
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
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    if (item.category.isNotEmpty)
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            border: Border.all(
                                                color: theme
                                                    .LightTheme.secondaryTextColor)),
                                        child: Text(
                                          item.category[0].toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: theme
                                                  .LightTheme.secondaryTextColor),
                                        ),
                                      ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    if (item.category.length > 1)
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            border: Border.all(
                                                color: theme
                                                    .LightTheme.secondaryTextColor)),
                                        child: Text(
                                          item.category[1].toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: theme
                                                  .LightTheme.secondaryTextColor),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            )
                          ])))
            ],
          )),
    );
  }
}
