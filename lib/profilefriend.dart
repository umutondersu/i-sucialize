// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_sucialize/Authenticator.dart';
import 'package:i_sucialize/databaseInterface.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FriendProfileView extends StatefulWidget {
  final String uid;
  const FriendProfileView({Key? key, required this.uid}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<FriendProfileView> createState() => _FriendProfileViewState(
        uid: uid,
      );
}

class _FriendProfileViewState extends State<FriendProfileView> {
  _FriendProfileViewState({required this.uid});
  final String uid;
  late DatabaseInterface _databaseInterface;

  @override
  void initState() {
    _databaseInterface = DatabaseInterface(uid: uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: _databaseInterface.getUserStream(),
        /*databaseInterface.getUserStream()*/
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Profile'),
                centerTitle: true,
                elevation: 0,
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primary,
                leading: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.backgroundcolor2, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.backgroundcolor2,
                    ),
                    child: StreamBuilder<DocumentSnapshot>(
                        stream: databaseInterface.getUserStream(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> s2) {
                          if (s2.hasError) {
                            return const Text('Something went wrong');
                          }
                          if (s2.connectionState == ConnectionState.waiting) {
                            return const SizedBox();
                          }

                          List<dynamic> following = s2.data!['followerList'];
                          if (following.contains(uid)) {
                            return TextButton(
                                onPressed: () {
                                  databaseInterface.removeFriend(uid);
                                },
                                child: Text(
                                  "Unfollow",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ));
                          }
                          return TextButton(
                              onPressed: () {
                                databaseInterface.addFriend(uid);
                              },
                              child: Text(
                                "Follow",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ));
                        }),
                  ),
                ),
                leadingWidth: 150,
                actions: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              body: Scaffold(
                backgroundColor: Color.fromRGBO(25, 25, 25, 1),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
              centerTitle: true,
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: AppColors.primary,
              leading: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.backgroundcolor2, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.backgroundcolor2,
                  ),
                  child: StreamBuilder<DocumentSnapshot>(
                      stream: databaseInterface.getUserStream(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> s2) {
                        if (s2.hasError) {
                          return const Text('Something went wrong');
                        }
                        if (s2.connectionState == ConnectionState.waiting) {
                          return const SizedBox();
                        }

                        List<dynamic> following = s2.data!['followerList'];
                        if (following.contains(uid)) {
                          return TextButton(
                              onPressed: () {
                                databaseInterface.removeFriend(uid);
                              },
                              child: Text(
                                "Unfollow",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ));
                        }
                        return TextButton(
                            onPressed: () {
                              databaseInterface.addFriend(uid);
                            },
                            child: Text(
                              "Follow",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ));
                      }),
                ),
              ),
              leadingWidth: 150,
              actions: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            body: Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(padding: EdgeInsets.all(25)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.network(
                              snapshot.data!['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          radius: 100,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: AppColors.primary,
                          ),
                          width: 200,
                          height: 40,
                          child: Center(
                            child: Text(snapshot.data!['username'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                          //child: ,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromRGBO(0, 72, 144, 1),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 100,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Followers",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                snapshot.data!['followers'].toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromRGBO(0, 72, 144, 1),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 100,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Following",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                snapshot.data!['following'].toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: AppColors.primary,
                          ),
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 100,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Posts",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                snapshot.data!['postCount'].toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: AppColors.primary,
                          ),
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 350,
                          height: 180,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromRGBO(0, 0, 0, 0),
                                        width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: AppColors.backgroundcolor2,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      snapshot.data!['description'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  width: 310,
                                  height: 95,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                backgroundColor: Color.fromRGBO(25, 25, 25, 1)),
          );
        });
  }
}
