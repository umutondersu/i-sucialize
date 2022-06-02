import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_sucialize/post_data.dart';
import 'package:i_sucialize/storage_services.dart';

class PostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StorageService _storageService = StorageService();
  String mediaUrl = '';

  Future<Post> addPost(String post, XFile pickedFile) async {
    var ref = _firestore.collection("users");

    mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));

    var documentRef = await ref.add({'post': post, 'image': mediaUrl});

    return Post(id: documentRef.id, post: post, image: mediaUrl);
  }

  Stream<QuerySnapshot> getPost() {
    var ref = _firestore.collection("Post").snapshots();

    return ref;
  }

  Future<void> removePost(String docId) {
    var ref = _firestore.collection("Post").doc(docId).delete();

    return ref;
  }
}