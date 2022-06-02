import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String id;
  String post;
  String image;
  String username;
  DateTime date;

  Post({required this.id, required this.post, required this.image, required this.username, required this.date});

  factory Post.fromSnapshot(DocumentSnapshot snapshot) {
    return Post(
      id: snapshot.id,
      post: snapshot["post"],
      image: snapshot["image"],
      username: snapshot["username"],
      date: snapshot["date"],

    );
  }
}