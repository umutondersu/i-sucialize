import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String id;
  String post;
  String image;

  Post({required this.id, required this.post, required this.image});

  factory Post.fromSnapshot(DocumentSnapshot snapshot) {
    return Post(
      id: snapshot.id,
      post: snapshot["post"],
      image: snapshot["image"],
    );
  }
}