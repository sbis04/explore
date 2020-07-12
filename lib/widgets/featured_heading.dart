import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(),
              Text(
                'Featured',
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Unique wildlife tours & destinations',
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 10),
            ],
          )
        : Row(
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
