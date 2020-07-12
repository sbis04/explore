import 'package:flutter/material.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  List _isHovering = [false, false, false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
            top: widget.screenSize.height * 0.40,
            left: widget.screenSize.width / 5,
            right: widget.screenSize.width / 5),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
              top: widget.screenSize.height / 50,
              bottom: widget.screenSize.height / 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[4] = true : _isHovering[4] = false;
                    });
                  },
                  onTap: () {},
                  child: Text(
                    'Destination',
                    style: TextStyle(
                      color: _isHovering[4]
                          ? Colors.blueGrey[900]
                          : Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(
                  height: widget.screenSize.height / 20,
                  child: VerticalDivider(
                    width: 1,
                    color: Colors.blueGrey[100],
                    thickness: 1,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[5] = true : _isHovering[5] = false;
                    });
                  },
                  onTap: () {},
                  child: Text(
                    'Dates',
                    style: TextStyle(
                      color: _isHovering[5]
                          ? Colors.blueGrey[900]
                          : Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(
                  height: widget.screenSize.height / 20,
                  child: VerticalDivider(
                    width: 1,
                    color: Colors.blueGrey[100],
                    thickness: 1,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[6] = true : _isHovering[6] = false;
                    });
                  },
                  onTap: () {},
                  child: Text(
                    'People',
                    style: TextStyle(
                      color: _isHovering[6]
                          ? Colors.blueGrey[900]
                          : Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(
                  height: widget.screenSize.height / 20,
                  child: VerticalDivider(
                    width: 1,
                    color: Colors.blueGrey[100],
                    thickness: 1,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[7] = true : _isHovering[7] = false;
                    });
                  },
                  onTap: () {},
                  child: Text(
                    'Experience',
                    style: TextStyle(
                      color: _isHovering[7]
                          ? Colors.blueGrey[900]
                          : Colors.blueGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
