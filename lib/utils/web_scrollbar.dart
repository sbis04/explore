import 'dart:async';

import 'package:flutter/material.dart';

class WebScrollbar extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;
  final double scrollerHeightFrac;

  WebScrollbar({
    @required this.child,
    @required this.scrollController,
    this.scrollerHeightFrac = 0.20,
  })  : assert(child != null),
        assert(scrollController != null),
        assert(scrollerHeightFrac != null &&
            scrollerHeightFrac < 1.0 &&
            scrollerHeightFrac > 0.0);

  @override
  _WebScrollbarState createState() => _WebScrollbarState();
}

class _WebScrollbarState extends State<WebScrollbar> {
  double _scrollPosition = 0;
  bool _isUpdating;
  Timer timer;

  _scrollListener() {
    setState(() {
      _scrollPosition = widget.scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    widget.scrollController.addListener(_scrollListener);
    _isUpdating = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double _scrollerHeight = screenSize.height * widget.scrollerHeightFrac;

    double _topMargin = widget.scrollController.hasClients
        ? ((screenSize.height *
                _scrollPosition /
                widget.scrollController.position.maxScrollExtent) -
            (_scrollerHeight *
                _scrollPosition /
                widget.scrollController.position.maxScrollExtent))
        : 0;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.depth == 0) {
          if (notification is ScrollUpdateNotification) {
            timer.cancel();
            setState(() {
              _isUpdating = true;
            });
          } else {
            timer = Timer(Duration(seconds: 5), () {
              setState(() {
                _isUpdating = false;
              });
            });
          }
          // print(_isUpdating);
        }
        return true;
      },
      child: Stack(
        children: [
          widget.child,
          AnimatedOpacity(
            opacity:
                widget.scrollController.hasClients ? _isUpdating ? 1 : 0 : 0,
            duration: Duration(milliseconds: 300),
            child: Container(
              alignment: Alignment.centerRight,
              height: MediaQuery.of(context).size.height,
              width: 10.0,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width - 10.0,
              ),
              decoration: BoxDecoration(color: Colors.black12),
              child: Container(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  child: Container(
                    height: _scrollerHeight,
                    width: 8.0,
                    margin: EdgeInsets.only(
                      left: 1.0,
                      right: 1.0,
                      top: _topMargin,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.all(
                        Radius.circular(3.0),
                      ),
                    ),
                  ),
                  onTapCancel: () {
                    timer = Timer(Duration(seconds: 5), () {
                      setState(() {
                        _isUpdating = false;
                      });
                    });
                  },
                  onTapDown: (details) {
                    timer.cancel();
                    setState(() {
                      _isUpdating = true;
                    });
                  },
                  onVerticalDragUpdate: (dragUpdate) {
                    widget.scrollController.position.moveTo(dragUpdate
                            .globalPosition.dy +
                        dragUpdate.globalPosition.dy *
                            (_scrollPosition /
                                widget.scrollController.position
                                    .maxScrollExtent) -
                        (_scrollerHeight *
                            _scrollPosition /
                            widget.scrollController.position.maxScrollExtent));

                    setState(() {
                      if (dragUpdate.globalPosition.dy >= 0 &&
                          _scrollPosition <=
                              widget
                                  .scrollController.position.maxScrollExtent) {
                        _scrollPosition = dragUpdate.globalPosition.dy +
                            dragUpdate.globalPosition.dy *
                                (_scrollPosition /
                                    widget.scrollController.position
                                        .maxScrollExtent) -
                            (_scrollerHeight *
                                _scrollPosition /
                                widget
                                    .scrollController.position.maxScrollExtent);
                      }
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
