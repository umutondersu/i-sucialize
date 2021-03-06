import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:i_sucialize/util/colors.dart';
import 'chat_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'messages.dart';
import 'package:i_sucialize/databaseInterface.dart';

class ChatScreen extends StatefulWidget {
  String email;
  ChatScreen({required this.email});
  @override
  _ChatScreenState createState() => _ChatScreenState(email: email);
}

class _ChatScreenState extends State<ChatScreen> {
  String email;
  _ChatScreenState({required this.email});

  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();
  late String image =
      "https://i.pinimg.com/originals/ce/5f/d3/ce5fd3590095d2aabe3ad6f6203dfe70.jpg";

  void getUserImage() async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(databaseInterface.uid)
        .get();
    Map<String, dynamic> data = docSnapshot.data()!;
    image = data['image'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainbackgroundcolor,
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.79,
              child: messages(
                email: email,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: message,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your message...',
                      enabled: true,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: AppColors.textcolor2),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: AppColors.textcolor2),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {},
                    onSaved: (value) {
                      message.text = value!;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (message.text.isNotEmpty) {
                      fs.collection('Messages').doc().set({
                        'message': message.text.trim(),
                        'time': DateTime.now(),
                        'email': email,
                      });

                      message.clear();
                    }
                  },
                  icon: Icon(
                    Icons.send_sharp,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
              title: const Text('SUspicious Group'),
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
              leadingWidth: 80,
              actions: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          }

          return AppBar(
            title: const Text('SUspicious Group'),
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
                      child: ClipOval(),
                      backgroundColor: AppColors.primary,
                      radius: 100,
                    ),*/
                )),
            leadingWidth: 80,
            actions: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
