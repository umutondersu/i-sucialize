import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authenticator {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signIn(String email, String password) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      return user.user!.uid;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<String> signUp(String email, String username, String password) async {
    try {
      var user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection("users").doc(user.user?.uid).set({
        "username" : username,
        "email" : email,
      });

      return user.user!.uid;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  signOut() async {
    return await _firebaseAuth.signOut();
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}