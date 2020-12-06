import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_slide_img.dart';
import 'categories.dart';
import '../item.dart';
import 'game_list_item.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({this.type, this.items});

  final String type;
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    if (items != null) {
      int numberOfExtraWidget = 1;
      return ListView.builder(
          itemCount: items.length + numberOfExtraWidget,
          itemBuilder: (BuildContext context, int index) {
            // Show multiple widgets before the list
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                      "Featured",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Theme
                            .of(context)
                            .textTheme
                            .headline5
                            .fontSize,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  SlideImg(items: items), // Slider
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                      "All games",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Theme
                            .of(context)
                            .textTheme
                            .headline5
                            .fontSize,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Categories(items: items),  // Categories (Chips)
                  SizedBox(height: 8),
                ],
              );
            }
            index = index - numberOfExtraWidget;
            return GameListItem(
                item: items[index],
                // TODO Remplacer le snackBar par une vue qui affiche le détail de l'item choisi
                onTap: (item) => Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(item.name),
                  duration: Duration(seconds: 1),
                )
                )
            );
          }
      );
    }
    else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}