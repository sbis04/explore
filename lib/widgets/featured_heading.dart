import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
