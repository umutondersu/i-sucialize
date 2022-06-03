// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_sucialize/profile.dart';
import 'package:path/path.dart';
import 'package:i_sucialize/home.dart';
import 'package:i_sucialize/storage_services.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:image_picker/image_picker.dart';

class PostView extends StatefulWidget {
  PostView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PostViewState();
  }
}

class PostViewState extends State<PostView> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? mediaUrl;
  DateTime? date;
  bool error = false;
  final TextEditingController postController = TextEditingController();

  Future pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedFile!;
    });
  }

  Future post() async {
    String post = postController.text;

    await uploadImageToFirebase();
    date = DateTime.now();
    int votes = 0;

    final data = {
      'username': prof.username,
      'post': post,
      'image': mediaUrl,
      'date': date,
      'votes': votes
    };

    postController.clear();

    var db = FirebaseFirestore.instance;
    db
        .collection("posts")
        .add(data)
        .then((value) => {
              setState(() {
                _image = null;
                mediaUrl = null;
                date = null;
              })
            })
        .catchError((err) => {
              setState(() {
                error = true;
              })
            });
  }

  Future postData() async {}

  StorageService _storageService = StorageService();

  Future uploadImageToFirebase() async {
    String fileName = basename(_image!.path);
    Reference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('uploads/${DateTime.now().millisecondsSinceEpoch}-$fileName');
    try {
      await firebaseStorageRef.putFile(File(_image!.path));
      print("Upload complete");
      mediaUrl = await firebaseStorageRef.getDownloadURL();
    } on FirebaseException catch (e) {
      print('ERROR: ${e.code} - ${e.message}');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Post'),
          centerTitle: true,
          elevation: 0,
          foregroundColor: AppColors.textcolor,
          backgroundColor: AppColors.primary,
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
                    fit: BoxFit.cover,
                  ),
                ),
                backgroundColor: AppColors.primary,
                radius: 100,
              ),
            ),
          ),
          leadingWidth: 80,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.backgroundcolor2, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.backgroundcolor2,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _image != null
                              ? Image.file(File(_image!.path))
                              : Image.asset('lib/assets/images/1.png'),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Text(
                            "Your Post:",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextField(
                            controller: postController,
                            decoration: InputDecoration(
                              counter: null,
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                                color: AppColors.textcolor, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.66,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromRGBO(0, 72, 144, 1),
                    ),
                    width: 130,
                    height: 50,
                    child: Center(
                      child: TextButton(
                        child: Text("Post",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        onPressed: post,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: IconButton(
                      onPressed: pickImage,
                      icon: Icon(Icons.upload),
                      iconSize: 50,
                      color: Colors.white,
                      splashRadius: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(25, 25, 25, 1));
  }
}
