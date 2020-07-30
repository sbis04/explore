import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:explore/screens/home_page.dart';
import 'package:explore/screens/login_page.dart';
import 'package:explore/utils/sign_in.dart';
import 'package:explore/widgets/auth_dialog.dart';
import 'package:flutter/material.dart';

import 'google_sign_in_button.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  // TextEditingController textControllerEmail;
  // FocusNode textFocusNodeEmail;
  // bool _isEditingEmail = false;

  // TextEditingController textControllerPassword;
  // FocusNode textFocusNodePassword;
  // bool _isEditingPassword = false;

  // bool _isRegistering = false;
  // bool _isLoggingIn = false;

  // String loginStatus;
  // Color loginStringColor = Colors.green;

  // String _validateEmail(String value) {
  //   value = value.trim();

  //   if (textControllerEmail.text != null) {
  //     if (value.isEmpty) {
  //       return 'Email can\'t be empty';
  //     } else if (!value.contains(RegExp(
  //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
  //       return 'Enter a correct email address';
  //     }
  //   }

  //   return null;
  // }

  // String _validatePassword(String value) {
  //   value = value.trim();

  //   if (textControllerEmail.text != null) {
  //     if (value.isEmpty) {
  //       return 'Password can\'t be empty';
  //     } else if (value.length < 6) {
  //       return 'Length of password should be greater than 6';
  //     }
  //   }

  //   return null;
  // }

  // @override
  // void initState() {
  //   textControllerEmail = TextEditingController();
  //   textControllerPassword = TextEditingController();
  //   textControllerEmail.text = null;
  //   textControllerPassword.text = null;
  //   textFocusNodeEmail = FocusNode();
  //   textFocusNodePassword = FocusNode();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'EXPLORE',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
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
              IconButton(
                icon: Icon(Icons.brightness_6),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                color: Colors.white,
                onPressed: () {
                  DynamicTheme.of(context).setBrightness(
                      Theme.of(context).brightness == Brightness.dark
                          ? Brightness.light
                          : Brightness.dark);
                },
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
                onTap: userEmail == null
                    ? () {
                        showDialog(
                          context: context,
                          builder: (context) => AuthDialog(),
                        );
                      }
                    : null,
                child: userEmail == null
                    ? Text(
                        'Sign in',
                        style: TextStyle(
                          color: _isHovering[3] ? Colors.white : Colors.white70,
                        ),
                      )
                    : Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: imageUrl != null
                                ? NetworkImage(imageUrl)
                                : null,
                            child: imageUrl == null
                                ? Icon(
                                    Icons.account_circle,
                                    size: 30,
                                  )
                                : Container(),
                          ),
                          SizedBox(width: 5),
                          Text(
                            name ?? userEmail,
                            style: TextStyle(
                              color: _isHovering[3]
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
