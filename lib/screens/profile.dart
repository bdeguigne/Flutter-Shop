import 'dart:io';

import 'package:flutter_shop_app/components/rounded_icon_with_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/components/user_layout.dart';
import 'package:flutter_shop_app/utils/constants.dart';
import '../item.dart';

class Profile extends StatefulWidget {
  const Profile({Key key, this.items}) : super(key: key);

  final List<Item> items;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightTheme.secondaryBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18),
            Text("Profile", style: AppText.h1),
            SizedBox(height: 18),
            UserLayout(
              avatar: _image == null ? null : _image,
              onTapAvatar: getImage,
            ),
            SizedBox(height: 32),
            Container(
              width: double.infinity,
              height: 100,
              child: Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundedIconWithText(
                        text: "Cart",
                        icon: Icon(Icons.shopping_bag, color: LightTheme.accentColor),
                          onTap: () => Navigator.pushNamed(context, '/cart')
                      ),
                      RoundedIconWithText(
                        text: "Favorites",
                        icon: Icon(Icons.favorite, color: LightTheme.accentColor),
                        onTap: () => Navigator.pushNamed(context, '/favorites')
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
