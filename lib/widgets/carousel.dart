import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final String imagePath = 'assets/images/';

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'assets/images/asia.jpg',
    'assets/images/africa.jpg',
    'assets/images/europe.jpg',
    'assets/images/south_america.jpg',
    'assets/images/australia.jpg',
    'assets/images/antarctica.jpg',
  ];

  final List<String> places = [
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'AUSTRAIA',
    'ANTARCTICA',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 18 / 8,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          carouselController: _controller,
        ),
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              places[_current],
              style: GoogleFonts.electrolize(
                letterSpacing: 8,
                fontSize: screenSize.width / 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 17 / 8,
          child: Center(
            heightFactor: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width / 8,
                  right: screenSize.width / 8,
                ),
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
                        for (int i = 0; i < places.length; i++)
                          Container(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[i] = true
                                      : _isHovering[i] = false;
                                });
                              },
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: screenSize.height / 80,
                                    bottom: screenSize.height / 80),
                                child: Text(
                                  places[i],
                                  style: TextStyle(
                                    color: _isHovering[i]
                                        ? Colors.blueGrey[900]
                                        : Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ),
                          ),

                        // InkWell(
                        //   splashColor: Colors.transparent,
                        //   hoverColor: Colors.transparent,
                        //   onHover: (value) {
                        //     setState(() {
                        //       value
                        //           ? _isHovering[4] = true
                        //           : _isHovering[4] = false;
                        //     });
                        //   },
                        //   onTap: () {},
                        //   child: Text(
                        //     'Destination',
                        //     style: TextStyle(
                        //       color: _isHovering[4]
                        //           ? Colors.blueGrey[900]
                        //           : Colors.blueGrey,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: screenSize.height / 20,
                        //   child: VerticalDivider(
                        //     width: 1,
                        //     color: Colors.blueGrey[100],
                        //     thickness: 1,
                        //   ),
                        // ),
                        // InkWell(
                        //   splashColor: Colors.transparent,
                        //   hoverColor: Colors.transparent,
                        //   onHover: (value) {
                        //     setState(() {
                        //       value
                        //           ? _isHovering[5] = true
                        //           : _isHovering[5] = false;
                        //     });
                        //   },
                        //   onTap: () {},
                        //   child: Text(
                        //     'Dates',
                        //     style: TextStyle(
                        //       color: _isHovering[5]
                        //           ? Colors.blueGrey[900]
                        //           : Colors.blueGrey,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: screenSize.height / 20,
                        //   child: VerticalDivider(
                        //     width: 1,
                        //     color: Colors.blueGrey[100],
                        //     thickness: 1,
                        //   ),
                        // ),
                        // InkWell(
                        //   splashColor: Colors.transparent,
                        //   hoverColor: Colors.transparent,
                        //   onHover: (value) {
                        //     setState(() {
                        //       value
                        //           ? _isHovering[6] = true
                        //           : _isHovering[6] = false;
                        //     });
                        //   },
                        //   onTap: () {},
                        //   child: Text(
                        //     'People',
                        //     style: TextStyle(
                        //       color: _isHovering[6]
                        //           ? Colors.blueGrey[900]
                        //           : Colors.blueGrey,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: screenSize.height / 20,
                        //   child: VerticalDivider(
                        //     width: 1,
                        //     color: Colors.blueGrey[100],
                        //     thickness: 1,
                        //   ),
                        // ),
                        // InkWell(
                        //   splashColor: Colors.transparent,
                        //   hoverColor: Colors.transparent,
                        //   onHover: (value) {
                        //     setState(() {
                        //       value
                        //           ? _isHovering[7] = true
                        //           : _isHovering[7] = false;
                        //     });
                        //   },
                        //   onTap: () {},
                        //   child: Text(
                        //     'Experience',
                        //     style: TextStyle(
                        //       color: _isHovering[7]
                        //           ? Colors.blueGrey[900]
                        //           : Colors.blueGrey,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
        // CarouselSlider(
        //   items: [
        //     Container(
        //       child: Center(
        //         child: Text(
        //           'NORTH AMERICA',
        //           style: GoogleFonts.electrolize(
        //             fontSize: 30,
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        //   options: CarouselOptions(
        //     scrollPhysics: NeverScrollableScrollPhysics(),
        //     enlargeCenterPage: true,
        //     aspectRatio: 16 / 9,
        //     autoPlay: true,
        //   ),
        //   carouselController: _controller,
        // ),
      ],
    );
  }
}
