import 'dart:async';

import 'package:flutter/material.dart';

class WebScrollbar extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final double heightFraction;
  final double width;
  final Color color;
  final Color backgroundColor;
  final bool isAlwaysShown;

  WebScrollbar({
    @required this.child,
    @required this.controller,
    this.heightFraction = 0.20,
    this.width = 8,
    this.color = Colors.black45,
    this.backgroundColor = Colors.black12,
    this.isAlwaysShown = false,
  })  : assert(child != null),
        assert(controller != null),
        assert(heightFraction != null &&
            heightFraction < 1.0 &&
            heightFraction > 0.0),
        assert(width != null),
        assert(color != null),
        assert(backgroundColor != null),
        assert(isAlwaysShown != null);

  @override
  _WebScrollbarState createState() => _WebScrollbarState();
}

class _WebScrollbarState extends State<WebScrollbar> {
  double _scrollPosition = 0;
  bool _isUpdating;
  Timer timer;

  _scrollListener() {
    setState(() {
      _scrollPosition = widget.controller.position.pixels;
    });
  }

  @override
  void initState() {
    widget.controller.addListener(_scrollListener);
    _isUpdating = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double _scrollerHeight = screenSize.height * widget.heightFraction;

    double _topMargin = widget.controller.hasClients
        ? ((screenSize.height *
                _scrollPosition /
                widget.controller.position.maxScrollExtent) -
            (_scrollerHeight *
                _scrollPosition /
                widget.controller.position.maxScrollExtent))
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
            opacity: widget.isAlwaysShown
                ? 1
                : widget.controller.hasClients ? _isUpdating ? 1 : 0 : 0,
            duration: Duration(milliseconds: 300),
            child: Container(
              alignment: Alignment.centerRight,
              height: MediaQuery.of(context).size.height,
              width: widget.width + 2,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width - widget.width + 2,
              ),
              color: widget.backgroundColor,
              child: Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  child: Container(
                    height: _scrollerHeight,
                    width: widget.width,
                    margin: EdgeInsets.only(
                      left: 1.0,
                      right: 1.0,
                      top: _topMargin,
                    ),
                    decoration: BoxDecoration(
                      color: widget.color,
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
                    widget.controller.position.moveTo(dragUpdate
                            .globalPosition.dy +
                        dragUpdate.globalPosition.dy *
                            (_scrollPosition /
                                widget.controller.position.maxScrollExtent) -
                        (_scrollerHeight *
                            _scrollPosition /
                            widget.controller.position.maxScrollExtent));

                    setState(() {
                      if (dragUpdate.globalPosition.dy >= 0 &&
                          _scrollPosition <=
                              widget.controller.position.maxScrollExtent) {
                        _scrollPosition = dragUpdate.globalPosition.dy +
                            dragUpdate.globalPosition.dy *
                                (_scrollPosition /
                                    widget
                                        .controller.position.maxScrollExtent) -
                            (_scrollerHeight *
                                _scrollPosition /
                                widget.controller.position.maxScrollExtent);
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
