// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

bool authSignedIn;
bool detailsUploaded;
String uid;
String name;
String email;
String imageUrl;

/// The main Firestore collection
// final CollectionReference mainCollection =
//     Firestore.instance.collection('sofia');

// Use this for production
// final DocumentReference documentReference = mainCollection.document('prod');

// Use this for testing
// final DocumentReference documentReference = mainCollection.document('test');

/// For checking if the user is already signed into the
/// app using Google Sign In
Future getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  authSignedIn = prefs.getBool('auth') ?? false;
  // detailsUploaded = prefs.getBool('details_uploaded') ?? false;

  final FirebaseUser user = await _auth.currentUser();

  if (authSignedIn == true) {
    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      email = user.email;
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
  email = user.email;
  imageUrl = user.photoUrl;

  // Only taking the first part of the name, i.e., First Name
  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', true);
  authSignedIn = true;

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
  email = user.email;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  // final FirebaseUser currentUser = await _auth.currentUser();
  // assert(user.uid == currentUser.uid);

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setBool('auth', true);
  // authSignedIn = true;

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
  email = user.email;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', true);
  authSignedIn = true;

  return 'Successfully logged in, User UID: ${user.uid}';
}

/// For signing out of their Google account
void signOutGoogle() async {
  await googleSignIn.signOut();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);
  authSignedIn = false;

  print("User Sign Out");
}
