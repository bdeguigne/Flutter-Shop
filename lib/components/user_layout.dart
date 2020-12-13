import 'package:flutter/material.dart';
import 'package:flutter_shop_app/utils/constants.dart';
import 'dart:io';

class UserLayout extends StatelessWidget {
  const UserLayout({Key key, this.onTapAvatar, this.avatar}) : super(key: key);

  final void Function() onTapAvatar;
  final File avatar;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Stack(children: [
        ClipOval(
          child: Image(
            fit: BoxFit.cover,
              width: 80,
              height: 80,
              image: avatar == null ?
              NetworkImage(
                  "https://medgoldresources.com/wp-content/uploads/2018/02/avatar-placeholder.gif")
              : FileImage(avatar)
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Icon(Icons.photo_camera_outlined),
          ),
        ),
        Positioned.fill(
            child: new Material(
                color: Colors.transparent,
                child: new InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  splashColor: LightTheme.rippleColor,
                  onTap: onTapAvatar,
                )
            )
        ),
      ]),
      SizedBox(width: 16),
      Text("Username",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
    ]);
  }
}
