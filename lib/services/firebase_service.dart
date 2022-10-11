import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
String? name;
String? email;

Future<String> signInWithEmail(String emailInput, String password) async {
  await Firebase.initializeApp();

  UserCredential userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: emailInput, password: password);

  final User? user = userCredential.user;

  if (user != null) {
    assert(user.email != null);
    name = null;
    email = user.email;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final User currentUser = _auth.currentUser!;
    assert(user.uid == currentUser.uid);
    // print('signInWithGoogle succeeded: $user');
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
    // Checking if email and name is null
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
  await FirebaseAuth.instance.signOut();
}
