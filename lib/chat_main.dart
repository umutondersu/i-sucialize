import 'package:flutter/material.dart';
import 'package:i_sucialize/chat_home.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:i_sucialize/home.dart';
import 'package:i_sucialize/databaseInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatelessWidget {
  ChatView({Key? key}) : super(key: key);

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
        body: ChatHome());
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
              title: const Text('Chat'),
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
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      backgroundColor: AppColors.primary,
                      radius: 100,
                    ),
                  )),
              leadingWidth: 80,
            );
          }

          return AppBar(
            title: const Text('Chat'),
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
                        s2.data!['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    backgroundColor: AppColors.primary,
                    radius: 100,
                  ),
                )),
            leadingWidth: 80,
          );
        });
  }
}
