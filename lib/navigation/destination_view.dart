import 'package:flutter/material.dart';
import 'destination.dart';
import '../item.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({ Key key, this.destination, this.items }) : super(key: key);

  final Destination destination;
  final List<Item> items;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: widget.destination.content
    );
  }
}
