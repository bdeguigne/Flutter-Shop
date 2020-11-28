import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/search.dart';
import '../screens/favorites.dart';
import '../screens/cart.dart';

class Destination {
  const Destination(this.index, this.title, this.icon, this.content);
  final int index;
  final String title;
  final IconData icon;
  final Widget content;
}

const List<Destination> allDestinations = <Destination>[
  Destination(0, 'Home', Icons.home, Home()),
  Destination(1, 'Search', Icons.search, Search()),
  Destination(2, 'Favorites', Icons.favorite_border, Favorites()),
  Destination(3, 'Cart', Icons.shopping_bag_outlined, Cart()),
];