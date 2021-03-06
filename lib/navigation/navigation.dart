import 'package:flutter/material.dart';
import '../item.dart';
import '../utils/hex_color.dart';
import '../components/rounded_navigation_bar.dart';
import 'destination.dart';
import 'destination_view.dart';

import '../screens/home.dart';
import '../screens/search.dart';
import '../screens/profile.dart';
import '../screens/cart.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key key, this.items}) : super(key: key);

  final List<Item> items;

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation>
    with TickerProviderStateMixin<Navigation> {
  List<AnimationController> _faders;
  List<Key> _destinationKeys;
  int _currentIndex = 0;

  List<Destination> _allDestinations;

  @override
  void initState() {
    super.initState();

    _allDestinations = <Destination>[
      Destination(0, 'Home', Icons.home, Home(items: widget.items)),
      Destination(1, 'Search', Icons.search, Search(items: widget.items)),
      Destination(2, 'Cart', Icons.shopping_bag_outlined, Cart(items: widget.items)),
      Destination(3, 'Profile', Icons.perm_identity, Profile(items: widget.items)),
    ];

    _faders =
        _allDestinations.map<AnimationController>((Destination destination) {
      return AnimationController(
          vsync: this, duration: Duration(milliseconds: 200));
    }).toList();
    _faders[_currentIndex].value = 1.0;
    _destinationKeys =
        List<Key>.generate(_allDestinations.length, (int index) => GlobalKey())
            .toList();
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _allDestinations.map<Widget>((Destination destination) {
          final Widget view = FadeTransition(
            opacity: _faders[destination.index]
                .drive(CurveTween(curve: Curves.fastOutSlowIn)),
            child: KeyedSubtree(
              key: _destinationKeys[destination.index],
              child: DestinationView(destination: destination),
            ),
          );
          if (destination.index == _currentIndex) {
            _faders[destination.index].forward();
            return view;
          } else {
            _faders[destination.index].reverse();
            if (_faders[destination.index].isAnimating) {
              return IgnorePointer(child: view);
            }
            return Offstage(child: view);
          }
        }).toList(),
      ),
      bottomNavigationBar: RoundedBottomNavigationBar(
        borderRadius: 15.0,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: HexColor.fromHex("#1d1d1d"),
            selectedItemColor: Colors.white,
            unselectedItemColor: HexColor.fromHex("#8e8e8e"),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 28,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: _allDestinations.map((Destination destination) {
              return BottomNavigationBarItem(
                  icon: Icon(destination.icon), label: destination.title);
            }).toList()),
      ),
    );
  }
}
