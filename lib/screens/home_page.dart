import 'package:explore/widgets/bottom_bar.dart';
import 'package:explore/widgets/carousel.dart';
import 'package:explore/widgets/destination_heading.dart';
import 'package:explore/widgets/explore_drawer.dart';
import 'package:explore/widgets/featured_heading.dart';
import 'package:explore/widgets/featured_tiles.dart';
import 'package:explore/widgets/floating_quick_access_bar.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:explore/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;
  bool _isUpdating;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      // print(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _isUpdating = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.blueGrey[900].withOpacity(_opacity),
              elevation: 0,
              title: Text(
                'EXPLORE',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: ExploreDrawer(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.depth == 0) {
            if (notification is ScrollUpdateNotification) {
              setState(() {
                _isUpdating = true;
              });
            } else {
              Future.delayed(Duration(seconds: 3), () {
                setState(() {
                  _isUpdating = false;
                });
              });
            }
            print(_isUpdating);
          }
          return true;
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: SizedBox(
                          height: screenSize.height * 0.45,
                          width: screenSize.width,
                          child: Image.asset(
                            'assets/images/cover.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          FloatingQuickAccessBar(screenSize: screenSize),
                          Container(
                            child: Column(
                              children: [
                                FeaturedHeading(
                                  screenSize: screenSize,
                                ),
                                FeaturedTiles(screenSize: screenSize)
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  // SizedBox(height: screenSize.height / 8),
                  DestinationHeading(screenSize: screenSize),
                  DestinationCarousel(),
                  SizedBox(height: screenSize.height / 10),
                  BottomBar(),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: _scrollController.hasClients ? _isUpdating ? 1 : 0 : 0,
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
                      height: 100.0,
                      width: 8.0,
                      margin: EdgeInsets.only(
                        left: 1.0,
                        right: 1.0,
                        top: _scrollController.hasClients
                            ? ((screenSize.height *
                                    _scrollPosition /
                                    _scrollController
                                        .position.maxScrollExtent) -
                                (100 *
                                    _scrollPosition /
                                    _scrollController.position.maxScrollExtent))
                            : 0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.0),
                        ),
                      ),
                    ),
                    onVerticalDragUpdate: (dragUpdate) {
                      _scrollController.position
                          .moveTo(dragUpdate.globalPosition.dy * 3.5);

                      setState(() {
                        if (dragUpdate.globalPosition.dy >= 0) {
                          _scrollPosition = dragUpdate.globalPosition.dy;
                        }
                        print(
                            "View offset ${_scrollController.offset} scroll-bar offset $_scrollPosition");
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
