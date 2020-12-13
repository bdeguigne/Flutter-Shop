import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "../utils/constants.dart" as theme;

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({this.height, this.labels, this.labelStyle, this.widgets});
  final double height;
  final List<String> labels;
  final TextStyle labelStyle;
  final List<Widget> widgets;

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {

  TabController _tabController;
  bool _showTabsShadow = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.labels.length);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      _showTabsShadow = false;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  bool checkScroll(ScrollNotification notification) {
    if (notification.metrics is FixedScrollMetrics && notification.metrics.pixels <= 10000.0) {
      if (notification.metrics.pixels >= 100.0) {
        setState(() {
          _showTabsShadow = true;
          // print(_showTabsShadow);
        });
      } else {
        setState(() {
          _showTabsShadow = false;
          // print(_showTabsShadow);
        });
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(widget.height),
          child:  Material(
            elevation: _showTabsShadow == true ? 5.0 : 0.0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TabBar(
                controller: _tabController,
                tabs: widget.labels.map((String label) {
                  return new Container(
                    width: _textSize(label, widget.labelStyle).width,
                    height: _textSize(label, widget.labelStyle).height,
                    child: new Tab(text: label),
                  );
                }).toList(),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                indicatorWeight: 1,
                labelStyle: widget.labelStyle,
                unselectedLabelColor: theme.LightTheme.unselectedLabelColor,
        ),
            ),
          ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.widgets.map((Widget content) {
          return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                return checkScroll(notification);
              },
              child: content);
        }).toList(),
      ),
    );
  }

  // Get the width and height of Text, base on the fontSize property
  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
