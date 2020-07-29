import 'package:explore/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.black54,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text(
              'EXPLORE',
              style: TextStyle(
                color: Colors.blueGrey[800],
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                letterSpacing: 3,
              ),
            ),
            GoogleButton(),
            Text(
              'By proceeding, you agree to our Terms of Use and confirm you have read our Privacy Policy.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                // letterSpacing: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
