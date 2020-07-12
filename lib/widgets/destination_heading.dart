import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinationHeading extends StatelessWidget {
  const DestinationHeading({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
