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
              ),
              InputChip(
                label: Text('Action'),
                onSelected: (bool value) {},
              ),
              InputChip(
                label: Text('RPG'),
                onSelected: (bool value) {},
              ),
            ],
          ),
        )
    );
  }
}
