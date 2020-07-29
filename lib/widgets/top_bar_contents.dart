import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:explore/screens/home_page.dart';
import 'package:explore/screens/login_page.dart';
import 'package:explore/utils/sign_in.dart';
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

  TextEditingController textControllerEmail;
  FocusNode textFocusNodeEmail;
  bool _isEditingEmail = false;

  TextEditingController textControllerPassword;
  FocusNode textFocusNodePassword;
  bool _isEditingPassword = false;

  bool _isRegistering = false;
  bool _isLoggingIn = false;

  String loginStatus;
  Color loginStringColor = Colors.green;

  String _validateEmail(String value) {
    value = value.trim();

    if (textControllerEmail.text != null) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return null;
  }

  String _validatePassword(String value) {
    value = value.trim();

    if (textControllerEmail.text != null) {
      if (value.isEmpty) {
        return 'Password can\'t be empty';
      } else if (value.length < 6) {
        return 'Length of password should be greater than 6';
      }
    }

    return null;
  }

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = null;
    textControllerPassword.text = null;
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

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
              // SizedBox(width: 10),
              // InkWell(
              //   onHover: (value) {
              //     setState(() {
              //       value ? _isHovering[2] = true : _isHovering[2] = false;
              //     });
              //   },
              //   onTap: () {
              //     // registerWithEmailPassword(
              //     //         textControllerEmail.text, textControllerPassword.text)
              //     //     .then((result) {
              //     //   print(result);
              //     // }).catchError((e) => print(e));
              //   },
              //   child: Text(
              //     'Sign Up',
              //     style: TextStyle(
              //       color: _isHovering[2] ? Colors.white : Colors.white70,
              //     ),
              //   ),
              // ),
              SizedBox(
                width: screenSize.width / 50,
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[3] = true : _isHovering[3] = false;
                  });
                },
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (context, setState) => Dialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: 400,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                    child: Text(
                                      'EXPLORE',
                                      style: TextStyle(
                                        color: Colors.blueGrey[800],
                                        fontSize: 24,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      bottom: 8,
                                    ),
                                    child: Text(
                                      'Email address',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontSize: 18,
                                        // fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        // letterSpacing: 3,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                    ),
                                    child: TextField(
                                      focusNode: textFocusNodeEmail,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      controller: textControllerEmail,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {
                                          _isEditingEmail = true;
                                        });
                                      },
                                      onSubmitted: (value) {
                                        textFocusNodeEmail.unfocus();
                                        FocusScope.of(context).requestFocus(
                                            textFocusNodePassword);
                                      },
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.blueGrey[800],
                                            width: 3,
                                          ),
                                        ),
                                        filled: true,
                                        hintStyle: new TextStyle(
                                          color: Colors.blueGrey[300],
                                        ),
                                        hintText: "Email",
                                        fillColor: Colors.white,
                                        errorText: _isEditingEmail
                                            ? _validateEmail(
                                                textControllerEmail.text)
                                            : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      bottom: 8,
                                    ),
                                    child: Text(
                                      'Password',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        // letterSpacing: 3,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                    ),
                                    child: TextField(
                                      focusNode: textFocusNodePassword,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                      controller: textControllerPassword,
                                      obscureText: true,
                                      autofocus: false,
                                      onChanged: (value) {
                                        setState(() {
                                          _isEditingPassword = true;
                                        });
                                      },
                                      onSubmitted: (value) {
                                        textFocusNodePassword.unfocus();
                                        FocusScope.of(context).requestFocus(
                                            textFocusNodePassword);
                                      },
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.blueGrey[800],
                                            width: 3,
                                          ),
                                        ),
                                        filled: true,
                                        hintStyle: new TextStyle(
                                          color: Colors.blueGrey[300],
                                        ),
                                        hintText: "Password",
                                        fillColor: Colors.white,
                                        errorText: _isEditingPassword
                                            ? _validatePassword(
                                                textControllerPassword.text)
                                            : null,
                                        errorStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            width: double.maxFinite,
                                            child: FlatButton(
                                              color: Colors.blueGrey[800],
                                              hoverColor: Colors.blueGrey[900],
                                              highlightColor: Colors.black,
                                              onPressed: () async {
                                                setState(() {
                                                  _isLoggingIn = true;
                                                  textFocusNodeEmail.unfocus();
                                                  textFocusNodePassword
                                                      .unfocus();
                                                });
                                                if (_validateEmail(
                                                            textControllerEmail
                                                                .text) ==
                                                        null &&
                                                    _validatePassword(
                                                            textControllerPassword
                                                                .text) ==
                                                        null) {
                                                  await signInWithEmailPassword(
                                                          textControllerEmail
                                                              .text,
                                                          textControllerPassword
                                                              .text)
                                                      .then((result) {
                                                    print(result);
                                                    setState(() {
                                                      loginStatus =
                                                          'You have successfully logged in';
                                                      loginStringColor =
                                                          Colors.green;
                                                    });
                                                  }).catchError((error) {
                                                    print(
                                                        'Login Error: $error');
                                                    setState(() {
                                                      loginStatus =
                                                          'Error occured while logging in';
                                                      loginStringColor =
                                                          Colors.red;
                                                    });
                                                  });
                                                } else {
                                                  setState(() {
                                                    loginStatus =
                                                        'Please enter email & password';
                                                    loginStringColor =
                                                        Colors.red;
                                                  });
                                                }
                                                setState(() {
                                                  _isLoggingIn = false;
                                                  textControllerEmail.text = '';
                                                  textControllerPassword.text =
                                                      '';
                                                  _isEditingEmail = false;
                                                  _isEditingPassword = false;
                                                });
                                                Future.delayed(
                                                    Duration(milliseconds: 500),
                                                    () {
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                    fullscreenDialog: true,
                                                    builder: (context) =>
                                                        HomePage(
                                                      loggedIn: true,
                                                    ),
                                                  ));
                                                });
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: 15.0,
                                                  bottom: 15.0,
                                                ),
                                                child: _isLoggingIn
                                                    ? SizedBox(
                                                        height: 16,
                                                        width: 16,
                                                        child:
                                                            CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                          valueColor:
                                                              new AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      )
                                                    : Text(
                                                        'Log in',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            width: double.maxFinite,
                                            child: FlatButton(
                                              color: Colors.blueGrey[800],
                                              hoverColor: Colors.blueGrey[900],
                                              highlightColor: Colors.black,
                                              onPressed: () async {
                                                setState(() {
                                                  textFocusNodeEmail.unfocus();
                                                  textFocusNodePassword
                                                      .unfocus();
                                                });
                                                if (_validateEmail(
                                                            textControllerEmail
                                                                .text) ==
                                                        null &&
                                                    _validatePassword(
                                                            textControllerPassword
                                                                .text) ==
                                                        null) {
                                                  setState(() {
                                                    _isRegistering = true;
                                                  });
                                                  await registerWithEmailPassword(
                                                          textControllerEmail
                                                              .text,
                                                          textControllerPassword
                                                              .text)
                                                      .then((result) {
                                                    setState(() {
                                                      loginStatus =
                                                          'You have registered successfully';
                                                      loginStringColor =
                                                          Colors.green;
                                                    });
                                                    print(result);
                                                  }).catchError((error) {
                                                    print(
                                                        'Registration Error: $error');
                                                    setState(() {
                                                      loginStatus =
                                                          'Error occured while registering';
                                                      loginStringColor =
                                                          Colors.red;
                                                    });
                                                  });
                                                } else {
                                                  setState(() {
                                                    loginStatus =
                                                        'Please enter email & password';
                                                    loginStringColor =
                                                        Colors.red;
                                                  });
                                                }
                                                setState(() {
                                                  _isRegistering = false;

                                                  textControllerEmail.text = '';
                                                  textControllerPassword.text =
                                                      '';
                                                  _isEditingEmail = false;
                                                  _isEditingPassword = false;
                                                });
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: 15.0,
                                                  bottom: 15.0,
                                                ),
                                                child: _isRegistering
                                                    ? SizedBox(
                                                        height: 16,
                                                        width: 16,
                                                        child:
                                                            CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                          valueColor:
                                                              new AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Colors.white,
                                                          ),
                                                        ),
                                                      )
                                                    : Text(
                                                        'Sign up',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  loginStatus != null
                                      ? Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 20.0,
                                            ),
                                            child: Text(
                                              loginStatus,
                                              style: TextStyle(
                                                color: loginStringColor,
                                                fontSize: 14,
                                                // letterSpacing: 3,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 40.0,
                                      right: 40.0,
                                    ),
                                    child: Container(
                                      height: 1,
                                      width: double.maxFinite,
                                      color: Colors.blueGrey[200],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Center(child: GoogleButton()),
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'By proceeding, you agree to our Terms of Use and confirm you have read our Privacy Policy.',
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        // letterSpacing: 3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                  // Navigator.of(context).pushNamed(LoginPage.route);
                  // signInWithEmailPassword().then((result) {
                  //   print(result);
                  // }).catchError((e) => print(e));
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    color: _isHovering[3] ? Colors.white : Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
