import 'dart:convert';
import 'dart:io';

import 'package:flutter_shop_app/components/rounded_icon_with_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/components/user_layout.dart';
import 'package:flutter_shop_app/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  Box<String> userAvatarBox;
  String _storedBase64Avatar;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      List<int> imageBytes = await _image.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      // print(base64Image);
      userAvatarBox.put("avatar", base64Image);
      setState(() {
        _storedBase64Avatar = base64Image;
      });

    } else {
      print('No image selected.');
    }
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(
        base64Decode(base64String),
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    );
  }

  @override
  void initState() {
    super.initState();
    userAvatarBox = Hive.box("user_avatar");
    if (userAvatarBox.containsKey("avatar")) {
      _storedBase64Avatar = userAvatarBox.get("avatar");
    } else {
      print("NO AVATAR");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightTheme.secondaryBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              Text("Profile", style: AppText.h1),
              SizedBox(height: 18),
              UserLayout(
                avatar: _storedBase64Avatar == null ? Image(
                    fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                      image: _image == null ?
                      NetworkImage(
                          "https://medgoldresources.com/wp-content/uploads/2018/02/avatar-placeholder.gif")
                      : FileImage(_image)
                  ) : imageFromBase64String(_storedBase64Avatar),
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
                            icon: Icon(Icons.shopping_bag,
                                color: LightTheme.accentColor),
                            onTap: () => Navigator.pushNamed(context, '/cart')),
                        RoundedIconWithText(
                            text: "Favorites",
                            icon: Icon(Icons.favorite,
                                color: LightTheme.accentColor),
                            onTap: () =>
                                Navigator.pushNamed(context, '/favorites'))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
