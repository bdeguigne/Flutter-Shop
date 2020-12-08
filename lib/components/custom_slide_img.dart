import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_shop_app/components/slider_item.dart';
import '../utils/constants.dart';
import '../item.dart';

class SlideImg extends StatefulWidget {
  const SlideImg({Key key, @required this.items}) : super(key: key);
  final List<Item> items;

  @override
  _SlideImgState createState() => _SlideImgState();
}

class _SlideImgState extends State<SlideImg> {
  int _currentIndex = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  List<Item> sliderItems = [];

  @override
  void initState() {
    super.initState();
    sliderItems = List.from(widget.items);
    sliderItems.removeWhere((element) => element.isFeatured == false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: sliderItems.map((item) {
            return Builder(builder: (BuildContext context) {
              return SliderItem(
                  item: item,
                  onTap: (item) =>
                      Navigator.pushNamed(context, '/detail', arguments: item));
            });
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(sliderItems, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? LightTheme.accentColor
                    : LightTheme.chipColor,
              ),
            );
          }),
        ),
      ],
    ));
  }
}
