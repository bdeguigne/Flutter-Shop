import 'package:flutter/material.dart';
import 'package:flutter_shop_app/components/game_list_item.dart';
import 'package:flutter_shop_app/components/searchbar.dart';
import 'package:flutter_shop_app/utils/constants.dart';
import '../item.dart';
import '../utils/search.dart';

class Search extends StatefulWidget {
  const Search({Key key, this.items}) : super(key: key);

  final List<Item> items;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _hasInput = false;
  List<String> _history = new List();
  List<Widget> _suggestions = new List();
  List<Widget> _searchResult = new List();

  // Control the focus of the search bar in parent
  GlobalKey<SearchBarState> _searchBarKey = GlobalKey();

  void getHistory() {
    //TODO Grab history data from local storage
    _history = <String>[
      "History 1",
      "History 2",
      "History 3",
    ];
  }

  @override
  void initState() {
    getHistory();
    super.initState();
  }

  List<Widget> addTileAtEnd(List<Item> items, String input) {
    List<Widget> widgets = [];

    if (items.length < 3) {
      for (int i = 0; i < items.length; i++) {
        widgets.add(GameListItem(
          height: 60,
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
          item: items[i],
          onTap: (item) =>  Navigator.pushNamed(context, '/detail', arguments: item),
          showCategories: false,
        ));
      }
    } else {
      for (int i = 0; i < 3; i++) {
        widgets.add(GameListItem(
          height: 60,
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
          item: items[i],
          onTap: (item) =>  Navigator.pushNamed(context, '/detail', arguments: item),
          showCategories: false,
        ));
      }
    }

    widgets.add(ListTile(
      leading: Icon(Icons.search, color: LightTheme.placeholderColor),
      title: Row(
        children: [
          Text("Search for ", style: TextStyle(fontSize: 14)),
          Text(input,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ],
      ),
      onTap: () {
        _searchBarKey.currentState.unFocus();
        _onSubmitted(input);
      },
      dense: true,
    ));
    return widgets;
  }

  void _onChanged(String input) {
    if (input == "") {
      setState(() {
        _hasInput = false;
      });
    } else {
      setState(() {
        _hasInput = true;
        _suggestions = addTileAtEnd(searchItems(widget.items, input), input);
      });
    }
  }

  void _onSubmitted(String input) {
    print('SUBMITTED = $input');
    List<Item> searchResult = searchItems(widget.items, input);
    List<Widget> results = [];

    searchResult.forEach((item) {
      results.add(GameListItem(
        style: "card",
        padding: EdgeInsets.only(bottom: 4.0, top: 8.0, left: 16.0, right: 16),
        item: item,
        showCategories: false,
        onTap: (item) => Navigator.pushNamed(context, '/detail', arguments: item)
      ));
    });

    setState(() {
      _searchResult = results;
    });
  }

  void _onRemove() {
    setState(() {
      _hasInput = false;
    });
  }

  Widget _showSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: SearchBar(
        key: _searchBarKey,
        placeholder: "Search games, consoles...",
        suggestions: _hasInput
            ? _suggestions
            : _history
                .map((element) => ListTile(
                      leading: Icon(Icons.schedule,
                          color: LightTheme.placeholderColor),
                      title: Text(element, style: TextStyle(fontSize: 14)),
                      onTap: () {},
                      dense: true,
                    ))
                .toList(),
        onChanged: _onChanged,
        onSubmitted: _onSubmitted,
        onClear: _onRemove,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightTheme.secondaryBackgroundColor,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text("Search", style: AppText.h1),
          ),
          SizedBox(height: 8),
          _showSearchBar(),
          Column(children: _searchResult)
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       backgroundColor: LightTheme.secondaryBackgroundColor,
  //       body: CustomScrollView(
  //         slivers: [
  //           SliverAppBar(
  //             backgroundColor: Colors.transparent,
  //             pinned: true,
  //             flexibleSpace: Flexible(child: _showSearchBar()),
  //             expandedHeight: 500,
  //           ),
  //           SliverList(
  //             // Use a delegate to build items as they're scrolled on screen.
  //             delegate: SliverChildBuilderDelegate(
  //               // The builder function returns a ListTile with a title that
  //               // displays the index of the current item.
  //               (context, index) => ListTile(title: Text('Item #$index')),
  //               // Builds 1000 ListTiles
  //               childCount: 1000,
  //             ),
  //           )
  //         ],
  //       ));
  // }
}
