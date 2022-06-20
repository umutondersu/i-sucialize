// ignore_for_file: prefer_const_constructors
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:i_sucialize/databaseInterface.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  final _nameController = TextEditingController();
  final _aboutController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? mediaUrl;

  Future pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedFile!;
    });
  }

  void changePP() async {
    await uploadImageToFirebase();
    if (mediaUrl != null) {
      databaseInterface.updateUserData({'image': mediaUrl});
      _image = null;
      mediaUrl = null;
    }
  }

  Future uploadImageToFirebase() async {
    if (_image == null) {
      print("No Image picked");
    } else {
      String fileName = basename(_image!.path);
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('uploads/${DateTime
          .now()
          .millisecondsSinceEpoch}-$fileName');
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: ,
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.primary,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 250,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Change Your Username",
                      style:
                          TextStyle(color: AppColors.textcolor, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary, width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.backgroundcolor2,
                  ),
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _nameController,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        counter: null,
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.primary,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 250,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Edit Your About Section",
                      style:
                          TextStyle(color: AppColors.textcolor, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary, width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.backgroundcolor2,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: 200,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextField(
                      controller: _aboutController,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        counter: null,
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.primary,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 300,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Upload A New Profile Picture",
                      style:
                      TextStyle(color: AppColors.textcolor, fontSize: 20),
                    ),
                  ),
                ),
                Center (
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: IconButton(
                      onPressed: pickImage,
                      icon: Icon(Icons.upload),
                      iconSize: 50,
                      color: Colors.white,
                      splashRadius: 30,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.primary,
                    ),
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    width: 250,
                    height: 55,
                    child: TextButton(
                      onPressed: () {
                        if (_nameController.text.isNotEmpty) {
                          //print(databaseInterface.runtimeType);
                          databaseInterface.updateUserData({
                            "username": _nameController.text,
                          });
                          _nameController.clear();
                        }
                        if (_nameController.text.isNotEmpty) {
                          databaseInterface.updateUserData(
                              {"description": _aboutController.text});
                          _aboutController.clear();
                        }
                        changePP();
                      },
                      child: Text(
                        "Save Changes",
                        style:
                            TextStyle(color: AppColors.textcolor, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.mainbackgroundcolor,
    );
  }
}

class EditProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  const EditProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColors.textcolor,
      backgroundColor: AppColors.primary,
      shadowColor: AppColors.secondary,
      leadingWidth: 80,
      leading: TextButton(
        child: CircleAvatar(
          radius: 100,
          child: ClipOval(
            child: Image.network(
              "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
              fit: BoxFit.cover,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text('Edit Profile'),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
      centerTitle: true,
    );
  }
}

class appBar extends StatelessWidget with PreferredSizeWidget {
  late String image =
      "https://i.pinimg.com/originals/ce/5f/d3/ce5fd3590095d2aabe3ad6f6203dfe70.jpg";
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: databaseInterface.getUserStream(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> s2) {
          if (s2.hasError) {
            return const Text('Something went wrong');
          }
          if (s2.connectionState == ConnectionState.waiting || !s2.hasData) {
            return AppBar(
              title: const Text('Edit Profile'),
              centerTitle: true,
              /*actions: [
              TextButton(
                onPressed: () => throw Exception(),
                child: const Text("Throw Test Exception"),
              ),
            ],*/
              elevation: 0,
              foregroundColor: AppColors.textcolor,
              backgroundColor: AppColors.primary,
            );
          }

          return AppBar(
            title: const Text('Edit Profile'),
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
                  child:ProfilePicture(name: s2.data!['username'], radius: 100, fontsize: 10, img:s2.data!['image']),
                  /*child: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      backgroundColor: AppColors.primary,
                      radius: 100,
                    ),*/
                )),
            leadingWidth: 80,
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          );
        });
  }
}
