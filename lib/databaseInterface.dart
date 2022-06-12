import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseInterface {
  final String uid;
  DatabaseInterface({required this.uid});

  /*Future<void> updateUserData(String sugars, String name, int strength) async {
    return await _userCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }*/

  Future<void> updateUserData(Map<String, dynamic> data) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(data);
  }

  Stream<DocumentSnapshot> getUserStream() {
    return FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() {
    return FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  Stream<DocumentSnapshot> getPostStream({required String postID}) {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postID)
        .snapshots();
  }

  Stream<QuerySnapshot> getAllPostsStream() {
    return FirebaseFirestore.instance.collection('posts').snapshots();
  }

  Stream<DocumentSnapshot> getMessageStream({required String messageID}) {
    return FirebaseFirestore.instance
        .collection('Messages')
        .doc(messageID)
        .snapshots();
  }

  Stream<QuerySnapshot> getAllMessagesStream() {
    return FirebaseFirestore.instance.collection('Messages').snapshots();
  }
}

DatabaseInterface? databaseInterface;
