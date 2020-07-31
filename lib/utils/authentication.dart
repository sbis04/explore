// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String uid;
String name;
String userEmail;
String imageUrl;

/// For checking if the user is already signed into the
/// app using Google Sign In
Future getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool authSignedIn = prefs.getBool('auth') ?? false;

  final FirebaseUser user = await _auth.currentUser();

  if (authSignedIn == true) {
    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoUrl;
    }
  }
}

/// For authenticating user using Google Sign In
/// with Firebase Authentication API.
///
/// Retrieves some general user related information
/// from their Google account for ease of the login process
Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  // Checking if email and name is null
  assert(user.uid != null);
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  uid = user.uid;
  name = user.displayName;
  userEmail = user.email;
  imageUrl = user.photoUrl;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', true);

  return 'Google sign in successful, User UID: ${user.uid}';
}

Future<String> registerWithEmailPassword(String email, String password) async {
  final AuthResult authResult = await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  final FirebaseUser user = authResult.user;

  // checking if uid or email is null
  assert(user.uid != null);
  assert(user.email != null);

  uid = user.uid;
  userEmail = user.email;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  return 'Successfully registered, User UID: ${user.uid}';
}

Future<String> signInWithEmailPassword(String email, String password) async {
  final AuthResult authResult = await _auth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  final FirebaseUser user = authResult.user;

  // checking if uid or email is null
  assert(user.uid != null);
  assert(user.email != null);

  uid = user.uid;
  userEmail = user.email;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', true);

  return 'Successfully logged in, User UID: ${user.uid}';
}

Future<String> signOut() async {
  await _auth.signOut();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);

  uid = null;
  userEmail = null;

  return 'User signed out';
}

/// For signing out of their Google account
void signOutGoogle() async {
  await googleSignIn.signOut();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);

  uid = null;
  name = null;
  userEmail = null;
  imageUrl = null;

  print("User signed out of Google account");
}
