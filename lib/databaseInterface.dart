import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseInterface {
  final String uid;
  DatabaseInterface({required this.uid});

  Future<void> updateUserData(Map<String, dynamic> data) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(data);
  }

  Future<void> updatePost(DocumentSnapshot d, Map<String, dynamic> data) async {
    return await FirebaseFirestore.instance
        .collection('posts')
        .doc(d.id)
        .update(data);
  }

  Future<bool> isUserExists(String uid) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      if (value.exists) {
        return true;
      } else {
        return false;
      }
    });
  }

  Stream<DocumentSnapshot> getUserStream() {
    return FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
  }

  Stream<DocumentSnapshot> getUser(String uuid) {
    return FirebaseFirestore.instance.collection('users').doc(uuid).snapshots();
  }

  Stream<QuerySnapshot> getUserFromName(String name) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: name)
        .limit(1)
        .snapshots();
  }

  Stream<DocumentSnapshot> getPostStream({required String postID}) {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postID)
        .snapshots();
  }

  Stream<QuerySnapshot> getAllPostsStream() {
    return FirebaseFirestore.instance
        .collection('posts')
        .orderBy('date', descending: true)
        .limit(100)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFriendsPosts(
      List<String> following) {
    return FirebaseFirestore.instance
        .collection('posts')
        .where('userid', whereIn: following)
        .snapshots();
  }

  Stream<QuerySnapshot> getAllNotifications() {
    return FirebaseFirestore.instance
        .collection('notifications')
        .orderBy('date', descending: true)
        .limit(20)
        .snapshots();
  }

  Stream<QuerySnapshot> getFriendsNotifications(List<String> following) {
    return FirebaseFirestore.instance
        .collection('notifications')
        .where('userid', whereIn: following)
        .orderBy('date', descending: true)
        .limit(20)
        .snapshots();
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

DatabaseInterface databaseInterface = new DatabaseInterface(uid: "");
