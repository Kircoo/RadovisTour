import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInGoogleProvider with ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final currentUser = FirebaseAuth.instance.currentUser;
  bool _isSignedIn;

  SignInGoogleProvider() {
    _isSignedIn = false;
  }

  bool get isSignedIn => _isSignedIn;

  set isSignedIn(bool isSignedIn) {
    _isSignedIn = isSignedIn;
    notifyListeners();
  }

  Future<GoogleSignInAccount> signInWithGoogle() async {
    isSignedIn = true;

    final user = await googleSignIn.signIn();

    if (user == null) {
      isSignedIn = false;
      return user;
    } else {
      final googleAuth = await user.authentication;

      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credentials);

      isSignedIn = false;
    }
    notifyListeners();
    return user;
  }

  Future signOutGoogle() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();

    print("User Signed Out");
    notifyListeners();
  }
}
