import 'package:flutter/material.dart';
import 'package:flutter_shop_app/utils/constants.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key,
    this.suggestions,
    this.suggestionsPadding = const EdgeInsets.only(bottom: 4.0),
    this.placeholder = "Search...",
    this.onClear,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  SearchBarState createState() => SearchBarState();

  // This list is showed when the user start writing
  final List<Widget> suggestions;

  final EdgeInsetsGeometry suggestionsPadding;
  final String placeholder;

  final void Function() onClear;
  final void Function(String input) onChanged;
  final void Function(String input) onSubmitted;
}

class SearchBarState extends State<SearchBar> with TickerProviderStateMixin {
  bool _isFocused = false;

  /* Control the focus of the input field */
  FocusNode focusNode;

  /* Store the user input */
  String _input;

  /* Handle animation between search and arrow icons on the left side
   of the searchBar */
  Widget _animatedIconSwitcher;

  /* Handle animation on the "suggestions" container */
  Animation<double> _animation;
  AnimationController _suggestionContainerController;

  /* Handle the clear Button */
  TextEditingController _controller = TextEditingController();

  // When the user tap on the input bar
  void focus() {
    setState(() {
      _animatedIconSwitcher = Icon(Icons.arrow_back,
          color: LightTheme.accentColor, key: ValueKey(2));
      _isFocused = true;
      _suggestionContainerController.forward();
    });
  }

  // When the user leave the input bar
  void unFocus() {
    focusNode.unfocus();
    setState(() {
      if (_input == "") {
        _animatedIconSwitcher =
            Icon(Icons.search, color: LightTheme.accentColor, key: ValueKey(1));
      }
      _isFocused = false;
      _suggestionContainerController.reverse();
    });
  }

  // When the user tap on the icon on the left side of the bar
  void _iconButton() {
    if (_isFocused == true) {
      focusNode.unfocus();
      setState(() {
        _animatedIconSwitcher =
            Icon(Icons.search, color: LightTheme.accentColor, key: ValueKey(1));
        _isFocused = false;
        _suggestionContainerController.reverse();
      });
    } else {
      focusNode.requestFocus();
      setState(() {
        _animatedIconSwitcher = Icon(Icons.arrow_back,
            color: LightTheme.accentColor, key: ValueKey(2));
        _isFocused = true;
        _suggestionContainerController.forward();
      });
    }
  }

  // When the user tap on the clear Button on the right side of the bar
  void _onClear() {
    _controller.clear();
    setState(() {
      _input = "";
    });
    widget.onClear();
  }

  @override
  void initState() {
    // _suggestionList = widget.suggestions;
    _input = "";
    focusNode = FocusNode();
    _animatedIconSwitcher =
        Icon(Icons.search, color: LightTheme.accentColor, key: ValueKey(1));
    _suggestionContainerController = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _suggestionContainerController,
      curve: Curves.fastOutSlowIn,
    );
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    // focusNode.dispose();
    // setState(() {
    //   _isFocused = false;
    // });

    super.dispose();
  }

  Widget searchBar() {
    return Container(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1,
                    color: _isFocused
                        ? LightTheme.dividerColor
                        : Colors.transparent))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Material(
                color: LightTheme.searchBarColor,
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 40,
                    width: 40,
                    child: AnimatedSwitcher(
                        transitionBuilder:
                            (Widget child, Animation<double> animation) =>
                                ScaleTransition(child: child, scale: animation),
                        duration: const Duration(milliseconds: 200),
                        child: _animatedIconSwitcher),
                  ),
                  onTap: () => _iconButton(),
                ),
              ),
            ),
            Flexible(
              child: TextField(
                controller: _controller,
                enableSuggestions: false,
                autocorrect: false,
                focusNode: focusNode,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: widget.placeholder),
                onTap: () => focus(),
                onChanged: (input) {
                  setState(() {
                    _input = input;
                  });
                  widget.onChanged(input);
                },
                 onSubmitted: (input) {
                  if (input != "") {
                    unFocus();
                    widget.onSubmitted(input);
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Material(
                color: LightTheme.searchBarColor,
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Icon(Icons.close),
                  ),
                  onTap: () => _onClear(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: LightTheme.searchBarColor,
          boxShadow: [
            _isFocused
                ? BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2.5),
                  )
                : BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 0.0,
                    blurRadius: 2,
                    offset: Offset(0, 2.5),
                  ),
          ]),
      child: Column(
        children: [
          searchBar(),
          SizeTransition(
            sizeFactor: _animation,
            child: widget.suggestions != null
                ? Padding(
                    padding: widget.suggestionsPadding,
                    child: AnimatedSize(
                      vsync: this,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 300),
                      child: Column(
                          children: widget.suggestions
                              .map((item) => new Material(
                                    color: Colors.transparent,
                                    child: new Container(child: item),
                                  ))
                              .toList()),
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
