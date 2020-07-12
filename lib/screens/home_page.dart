import 'package:explore/widgets/bottom_bar.dart';
import 'package:explore/widgets/carousel.dart';
import 'package:explore/widgets/destination_heading.dart';
import 'package:explore/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _isHovering = [false, false, false, false, false, false, false, false];

  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
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
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: TopBar(_opacity),
      ),
      body: SingleChildScrollView(
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
                Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.55,
                    left: screenSize.width / 15,
                    right: screenSize.width / 15,
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Featured',
                              style: GoogleFonts.montserrat(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Unique wildlife tours & destinations',
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenSize.height / 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: screenSize.width / 6,
                                    width: screenSize.width / 3.8,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'assets/images/trekking.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: screenSize.height / 70,
                                    ),
                                    child: Text(
                                      'Trekking',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: screenSize.width / 6,
                                    width: screenSize.width / 3.8,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'assets/images/animals.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: screenSize.height / 70,
                                    ),
                                    child: Text(
                                      'Animals',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: screenSize.width / 6,
                                    width: screenSize.width / 3.8,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'assets/images/photography.jpeg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: screenSize.height / 70,
                                    ),
                                    child: Text(
                                      'Photography',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  heightFactor: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: screenSize.height * 0.40,
                        left: screenSize.width / 5,
                        right: screenSize.width / 5),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height / 50,
                          bottom: screenSize.height / 50,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[4] = true
                                      : _isHovering[4] = false;
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
                              height: screenSize.height / 20,
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
                                  value
                                      ? _isHovering[5] = true
                                      : _isHovering[5] = false;
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
                              height: screenSize.height / 20,
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
                                  value
                                      ? _isHovering[6] = true
                                      : _isHovering[6] = false;
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
                              height: screenSize.height / 20,
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
                                  value
                                      ? _isHovering[7] = true
                                      : _isHovering[7] = false;
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
    );
  }
}
