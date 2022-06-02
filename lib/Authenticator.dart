import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Authenticator {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async
  {
    var user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  Future<User?> signUp(String email, String username, String password) async
  {
    var user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

    await _firestore.collection("users").doc(user.user?.uid).set(
      {
        "username" : username,
        "email" : email,
      }
    );

    return user.user;
  }

  signOut() async
  {
    return await _firebaseAuth.signOut();
  }
}