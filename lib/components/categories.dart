import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return(
      Center(
          child: Row(
            children: [
              InputChip(
                label: Text('Adventure'),
                onSelected: (bool value) {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
              SizedBox(width: 8),
              InputChip(
                label: Text('Action'),
                onSelected: (bool value) {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
              SizedBox(width: 8),
              InputChip(
                label: Text('RPG'),
                onSelected: (bool value) {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ],
          ),
        )
    );
  }
}
