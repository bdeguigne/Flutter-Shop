import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_shop_app/components/genre_layout.dart';
import 'package:flutter_shop_app/components/slider_item.dart';
import 'package:hive/hive.dart';
import '../item.dart';
import '../utils/constants.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _currentIndex = 0;
  Box<Item> cartDataBox;
  String addedToCartResponse;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    cartDataBox = Hive.box("cart_data");

  }

  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context).settings.arguments;

    bool isItemAdded() {
      for (int i = 0; cartDataBox.get(i) != null; i++) {
        var itemBox = cartDataBox.get(i);
        if (itemBox.name == item.name) {
          print("ALREADY ADDED");
          return true;
        }
      }
      return false;
    }

    void onSlideChanged(index) {
      setState(() {
        _currentIndex = index;
      });
    }

    String addToCart() {
      if (isItemAdded() == true) {
        return "This item is already in your cart";
      } else {
        cartDataBox.add(item);
        return "Successfully added in your cart !";
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageSlider(context, onSlideChanged, item.screenshots),
                SizedBox(height: 16),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(item.screenshots, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? LightTheme.accentColor
                              : LightTheme.chipColor,
                        ),
                      );
                    })),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      GenreLayout(
                        genres: item.category,
                        textSize: 14,
                      ),
                      SizedBox(height: 16),
                      if (item.isPromo == true)
                        (Row(
                          children: [
                            Text(
                              '\$${item.price}',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w500,
                                  color: LightTheme.secondaryTextColor),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '\$${item.newPrice}',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: LightTheme.buttonColor),
                            ),
                          ],
                        ))
                      else
                        (Row(
                          children: [
                            Text(
                              '\$${item.price}',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: LightTheme.buttonColor),
                            ),
                          ],
                        )),
                      SizedBox(height: 16),
                      Container(
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        child: Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            /*3*/
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 65,
              child: RaisedButton.icon(
                  icon: Icon(Icons.shopping_bag_outlined, size: 28),
                  textColor: Colors.white,
                  label: Text(
                    "Add to cart",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: LightTheme.accentColor,
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String response = addToCart();
                      return  AlertDialog(
                        title: Center(child: Text(response)),
                        actions: [
                          FlatButton(child: Text("OK"), onPressed: () => Navigator.pop(context), color: LightTheme.accentColor,)
                        ],
                      );
                    },
                  )
              )),
        ),
      ),
    );
  }
}

CarouselSlider imageSlider(context, onPageChanged, List<String> screenshots) {
  return new CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: false,
        aspectRatio: 2.0,
        enlargeCenterPage: false,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {
          onPageChanged(index);
        },
      ),
      items: screenshots.map((screenshot) {
        return Builder(builder: (BuildContext context) {
          return Container(
              child: FadeInImage.assetNetwork(
            placeholder: 'assets/banner_placeholder.png',
            image: screenshot,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 500),
          ));
        });
      }).toList());
}
