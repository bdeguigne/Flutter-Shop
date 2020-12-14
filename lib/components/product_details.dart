import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../item.dart';
import '../utils/constants.dart' as theme;

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                /*1*/
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*2*/
                    Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        constraints: BoxConstraints.expand(
                            height: 200
                        ),
                        child: imageSlider(context)),
                    Container(
                      height: 40,
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                Container(
                  height: 60,
                  child: Text('\$${item.price}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: theme.LightTheme.buttonColor),
                  ),
              ),
                    Container(
                      height: 30,
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  Container(
                height: 100,
                child: Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
                    Center(child:
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            ElevatedButton.icon(
                              icon: const Icon(Icons.add_shopping_cart, size: 18),
                              label: Text("Add to cart"),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                            )],
                      ),
                      height: 200,
                    ),),
                  ],
                ),
              ),
              /*3*/
            ],
          ),
        )
    );
  }
}

Swiper imageSlider(context){

  return new Swiper(
    autoplay: true,
    itemBuilder: (BuildContext context, int index) {
      return new Image.asset(
        'assets/banner_placeholder.png',
        fit: BoxFit.fitHeight,
      );
    },
    itemCount: 10,
    viewportFraction: 0.8,
    scale: 0.9,
  );

}
