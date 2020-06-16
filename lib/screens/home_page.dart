import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _isHovering = [false, false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'EXPLORE',
                  style: GoogleFonts.montserrat(
                    color: Colors.blueGrey[100],
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: screenSize.width / 8),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[0] = true
                                : _isHovering[0] = false;
                          });
                        },
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Discover',
                              style: TextStyle(
                                color: _isHovering[0]
                                    ? Colors.blue[200]
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[0],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width / 20),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[1] = true
                                : _isHovering[1] = false;
                          });
                        },
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Contact Us',
                              style: TextStyle(
                                color: _isHovering[1]
                                    ? Colors.blue[200]
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[1],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[2] = true : _isHovering[2] = false;
                    });
                  },
                  onTap: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: _isHovering[2] ? Colors.white : Colors.white70,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 50,
                ),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[3] = true : _isHovering[3] = false;
                    });
                  },
                  onTap: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: _isHovering[3] ? Colors.white : Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
            Container(
              padding: EdgeInsets.only(
                  top: screenSize.height / 8, bottom: screenSize.height / 15),
              width: screenSize.width,
              // color: Colors.black,
              child: Text(
                'Destinations diversity',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
