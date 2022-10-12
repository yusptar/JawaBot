import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
String? name;
String? email;
String? image;

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();
  final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user!;
  if (user != null) {
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);
    name = user.displayName;
    email = user.email;
    image = user.photoURL;
    // Only taking the first part of the name, i.e., First Name
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final User currentUser = _auth.currentUser!;
    assert(user.uid == currentUser.uid);
    return '$user';
  }
  return 'Failure';
}

Future<String> signInWithEmail(String emailInput, String password) async {
  await Firebase.initializeApp();

  UserCredential userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: emailInput, password: password);

  final User? user = userCredential.user;

  if (user != null) {
    assert(user.email != null);
    email = user.email;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final User currentUser = _auth.currentUser!;
    assert(user.uid == currentUser.uid);
    return '$user';
  }
  return 'Failed to sign in with Email & Password';
}

Future<String> signUpWithEmail(String emailregis, String passwordregis) async {
  await Firebase.initializeApp();
  UserCredential userCredential = (await _auth.createUserWithEmailAndPassword(
      email: emailregis, password: passwordregis));

  final User? user = userCredential.user;
  if (user != null) {
    assert(user.email != null);
    email = user.email;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final User currentUser = _auth.currentUser!;
    assert(user.uid == currentUser.uid);
    return '$user';
  }
  return 'Failed to Register';
}

Future<void> signOut() async {
  await _auth.signOut();
}

Future<void> signOutGoogle() async {
  await _googleSignIn.signOut();
}
