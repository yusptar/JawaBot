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
  final User? user = authResult.user;
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

Future signInWithEmail(email, password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return 'success';
  } catch (e) {
    return e;
  }
}

Future<String> signUpWithEmail(String email, String password) async {
  await Firebase.initializeApp();
  try {
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return result.user!.uid;
  } catch (e) {
    return 'failed';
  }
}

Future<String> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    return 'success';
  } catch (e) {
    return 'failed';
  }
}

Future resetPassword(email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    return 'success';
  } catch (e) {
    return e;
  }
}

Future<void> signOutGoogle() async {
  await _googleSignIn.signOut();
}
