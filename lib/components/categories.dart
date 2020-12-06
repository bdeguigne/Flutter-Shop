import 'package:flutter/material.dart';
import 'package:flutter_shop_app/components/custom_chip.dart';
import 'package:flutter_shop_app/item.dart';

class Categories extends StatefulWidget {
  const Categories({Key key, @required this.items}) : super(key: key);

  final List<Item> items;
  @override
  _CategoriesState createState() => _CategoriesState();
}

class Category {
  Category(this.category, this.count);
  String category;
  int count;

  // for printing the class
  @override
  String toString() {
    return "category : $category = $count";
  }
}

class _CategoriesState extends State<Categories> {
  List<Category> _categories = new List<Category>();

  @override
  void initState() {
    var map = new Map();

    // Iterate through each categories and store all categories with their counter of occurrences
    widget.items.forEach((item) {
      item.category.forEach((category) {
        if (!map.containsKey(category)) {
          map[category] = 1;
        } else {
          map[category] += 1;
        }
      });
    });

    //Store all occurrence in a list of 'Category' class
    map.forEach((key, value) {
      _categories.add(new Category(key, value));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: _categories.asMap().entries.map((entry) {
            int index = entry.key;
            Category category = entry.value;
            return Padding(
                padding: index == 0
                    ? const EdgeInsets.only(left: 16.0, right: 8.0)
                    : index == _categories.length - 1
                        ? const EdgeInsets.only(right: 16.0)
                        : const EdgeInsets.only(right: 8.0),
                child: CustomChip(
                    label: category.category,
                    rightLabel: category.count.toString(),
                    onPressed: (String category) =>
                    // TODO Remplacer le snackBar par une vue qui affiche les jeux de la catégorie choisie
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Category : $category'),
                            duration: Duration(seconds: 1),
                          ),
                        )));
          }).toList()),
    );
  }
}
