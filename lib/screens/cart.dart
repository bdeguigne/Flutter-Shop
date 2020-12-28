import 'package:flutter/material.dart';
import 'package:flutter_shop_app/components/game_list_item.dart';
import 'package:flutter_shop_app/utils/constants.dart';
import 'package:hive/hive.dart';
import '../item.dart';

class Cart extends StatefulWidget {
  const Cart({Key key, this.items}) : super(key: key);

  final List<Item> items;

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Box<Item> _cartDataBox;
  double total = 0;

  void getCartData() {
    print("OKAY GET");
    /* for (int i = 0; cartDataBox.get(i) != null; i++) {
      print("PRRINT BOX "+ i.toString());
      print(cartDataBox.get(i));
    }*/

    //print(_cartItems);
  }

  void clear() {
    setState(() {});
    _cartDataBox.clear();
  }

  @override
  void initState() {
    super.initState();

    _cartDataBox = Hive.box("cart_data");
  }

  List<Widget> showCartItems() {
    List<Widget> cartItems = new List();
    double totalPrice = 0;
    for (int i = 0; _cartDataBox.get(i) != null; i++) {
      Item item = _cartDataBox.get(i);
      //Get the total price
      if (item.isPromo == true) {
        totalPrice += item.newPrice;
      } else {
        totalPrice += item.price;
      }

      cartItems.add(GameListItem(
          style: "card",
          padding:
              EdgeInsets.only(bottom: 4.0, top: 8.0, left: 16.0, right: 16),
          item: item,
          showCategories: false,
          onTap: (item) =>
              Navigator.pushNamed(context, '/detail', arguments: item)));
    }
    setState(() {
      total = totalPrice;
    });
    return cartItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightTheme.secondaryBackgroundColor,
      body: ListView(
        children: [
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text("Cart", style: AppText.h1),
          ),
          SizedBox(height: 8),
          Column(
            children: showCartItems(),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Total: ", style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700
                  )),
                  Text("\$" + total.toStringAsFixed(2), style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: LightTheme.accentColor
                  )),
                ],
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 65,
                child: RaisedButton(
                  onPressed: clear,
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: LightTheme.accentColor,
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
