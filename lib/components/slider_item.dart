import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/utils/constants.dart';

import '../item.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({Key key, this.item, this.onTap}) : super(key: key);
  final Item item;
  final void Function(Item featuredItem) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.30,
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(),
          child: Stack(children: [
            new Positioned.fill(
              bottom: 0.0,
              child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: Image.network(
                        item.thumbnail,
                        height: 190.0,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Image(
                            height: 190.0,
                            image: AssetImage("assets/banner_placeholder.png"),
                            fit: BoxFit.cover,
                          );
                        },
                      )
                      )),
            ),
            new Positioned.fill(
                child: new Material(
                    color: Colors.transparent,
                    child: new InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      splashColor: LightTheme.rippleColor,
                      onTap: () => onTap(item),
                    )
                )
            ),
          ]),
        )
    );
  }
}
