import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:i_sucialize/databaseInterface.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:i_sucialize/feed_items.dart';
import 'package:intl/intl.dart';
import 'package:i_sucialize/home.dart';
import 'package:flutter/cupertino.dart';

class FeedView extends StatefulWidget {
  FeedView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
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

  String voteStatus(DocumentSnapshot d) {
    List<dynamic> upVotes = d['upVotes'];
    List<dynamic> downVotes = d['downVotes'];
    if (upVotes.contains(databaseInterface.uid)) {
      return "upvote";
    } else if (downVotes.contains(databaseInterface.uid)) {
      return "downvote";
    }
    return "none";
  }

  int voteCount(DocumentSnapshot d) {
    List<dynamic> upVotes = d['upVotes'];
    List<dynamic> downVotes = d['downVotes'];
    return upVotes.length - downVotes.length;
  }

  String getDifference(DateTime time) {
    DateTime now = DateTime.now();

    int day = now.difference(time).inDays % 365;
    int hour = now.difference(time).inHours % 24;
    int min = now.difference(time).inMinutes % 60;
    int sec = now.difference(time).inSeconds % 60;

    String dif = "";
    if (day > 0) dif = day.toString() + "d ";
    if (hour > 0) dif = dif + hour.toString() + "h ";
    if (min > 0) dif = dif + min.toString() + "m ";
    if (sec > 0) dif = dif + sec.toString() + "s";

    return dif;
  }

  void toggleUpVote(DocumentSnapshot d) {
    List<dynamic> upVotes = d['upVotes'];
    List<dynamic> downVotes = d['downVotes'];
    if (upVotes.contains(databaseInterface.uid)) {
      upVotes.remove(databaseInterface.uid);
    } else {
      upVotes.add(databaseInterface.uid);
      if (downVotes.contains(databaseInterface.uid)) {
        downVotes.remove(databaseInterface.uid);
      }
    }

    databaseInterface
        .updatePost(d, {'upVotes': upVotes, 'downVotes': downVotes});
  }

  void toggleDownVote(DocumentSnapshot d) {
    List<dynamic> upVotes = d['upVotes'];
    List<dynamic> downVotes = d['downVotes'];
    if (downVotes.contains(databaseInterface.uid)) {
      downVotes.remove(databaseInterface.uid);
    } else {
      downVotes.add(databaseInterface.uid);
      if (upVotes.contains(databaseInterface.uid)) {
        upVotes.remove(databaseInterface.uid);
      }
    }

    databaseInterface
        .updatePost(d, {'upVotes': upVotes, 'downVotes': downVotes});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: databaseInterface.getAllPostsStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Feed'),
                centerTitle: true,
                elevation: 0,
                foregroundColor: AppColors.textcolor,
                backgroundColor: AppColors.primary,
              ),
              backgroundColor: Color.fromRGBO(25, 25, 25, 1));
        }
        getUserImage();

        return Scaffold(
          appBar: feedAppBar(),
          /*appBar: AppBar(
            title: const Text('Feed'),
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
          ),*/
          body: Scaffold(
              body: Container(
                //reverse: true,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      itemCount: snapshot.data!.size,
                      itemBuilder: (context, index) {
                        DocumentSnapshot d = snapshot.data!.docs[index];

                        return StreamBuilder(
                          stream: databaseInterface.getUser(d['userid']),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> s2) {
                            if (s2.hasError) {
                              return const Text('Something went wrong');
                            }
                            if (s2.connectionState == ConnectionState.waiting ||
                                !s2.hasData) {
                              return Container();
                            }

                            DocumentSnapshot u = s2.requireData;
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.backgroundcolor, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: AppColors.backgroundcolor2,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        IconButton(
                                          iconSize: 25,
                                          onPressed: () {
                                            toggleUpVote(d);
                                          },
                                          icon: Icon(
                                            voteStatus(d) == "upvote" ? Typicons.up : Typicons.up_outline,
                                            color: voteStatus(d) == "upvote"
                                                ? Colors.lightGreen
                                                : Colors.grey,
                                          ),
                                        ),
                                        Text(voteCount(d).toString(), style: TextStyle(fontWeight: FontWeight.w600, color: voteCount(d) == 0 ? Colors.white : voteCount(d) > 0 ? Colors.lightGreen : Colors.red.shade900),),
                                        IconButton(
                                          iconSize: 25,
                                          onPressed: () {
                                            toggleDownVote(d);
                                          },
                                          icon: Icon(
                                            voteStatus(d) == "downvote" ? Typicons.down : Typicons.down_outline,
                                            color: voteStatus(d) == "downvote"
                                                ? Colors.red.shade900
                                                : Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    child: ClipOval(
                                      child: Image.network(
                                        u['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    backgroundColor: AppColors.backgroundcolor2,
                                    radius: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          u['username'] +
                                              " ● " +
                                              getDifference(d['date'].toDate()),
                                          style: TextStyle(
                                              color: AppColors.textcolor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              d['post'],
                                              style: TextStyle(
                                                  color: AppColors.textcolor,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white24,
                                          ),
                                          width: 200,
                                        ),
                                        SizedBox(height: 5),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              20), // Image border
                                          child: SizedBox.fromSize(
                                            size:
                                                Size(150, 100), // Image radius
                                            child: Image.network(
                                              d['image'],
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              width: 375,
                            );
                          },
                        );
                      },
                    )),
              ),
              backgroundColor: Color.fromRGBO(25, 25, 25, 1)),
        );
      },
    );
  }
}

class feedAppBar extends StatelessWidget with PreferredSizeWidget {
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
              title: const Text('Feed'),
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
            title: const Text('Feed'),
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
          );
        });
  }
}
/*
class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AmogSu Feed'),
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
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  border:
                  Border.all(color: AppColors.backgroundcolor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.backgroundcolor2,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.arrow_circle_up_outlined),
                                      Text("23"),
                                      Icon(Icons.arrow_circle_down_outlined),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://m.media-amazon.com/images/I/316sTqrlXEL._AC_SY780_.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  backgroundColor: AppColors.backgroundcolor2,
                                  radius: 20,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "i/Amogdrip",
                                    style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(2.0),
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      'Amongus Drip Vcdoded will eventually decrease.',
                                      style: TextStyle(
                                          color: AppColors.textcolor2),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white24,
                                    ),
                                    width: 210,
                                  ),
                                  SizedBox(height: 5),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        20), // Image border
                                    child: SizedBox.fromSize(
                                      size: Size(200, 100), // Image radius
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQPVQnqNXXsWAVKGXH4UrwtNLqC2S5kfI8ug&usqp=CAU",
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        width: 320,
                      ),
                    ],
                  ),
                ),
                width: 350,
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  border:
                  Border.all(color: AppColors.backgroundcolor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.backgroundcolor2,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.arrow_circle_up_outlined),
                                      Text("23"),
                                      Icon(Icons.arrow_circle_down_outlined),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://i.pinimg.com/236x/db/b3/9d/dbb39d8f7713c3e160754de3bd709ca3.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  backgroundColor: AppColors.backgroundcolor2,
                                  radius: 20,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "i/AskAmong",
                                    style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(2.0),
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      'What will be the changes in nowadays murders???',
                                      style: TextStyle(
                                          color: AppColors.textcolor2),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white24,
                                    ),
                                    width: 210,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        width: 320,
                      ),
                    ],
                  ),
                ),
                width: 350,
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  border:
                  Border.all(color: AppColors.backgroundcolor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.backgroundcolor2,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.arrow_circle_up_outlined),
                                      Text("36"),
                                      Icon(Icons.arrow_circle_down_outlined),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJJmqSGd5IdcQuqo9UxLnw3GUQwnUqKXlUtQ&usqp=CAU",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  backgroundColor: AppColors.backgroundcolor2,
                                  radius: 20,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "i/AmogNews",
                                    style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(2.0),
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      'Today news on AmogNews...',
                                      style: TextStyle(
                                          color: AppColors.textcolor2),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white24,
                                    ),
                                    width: 210,
                                  ),
                                  SizedBox(height: 5),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        20), // Image border
                                    child: SizedBox.fromSize(
                                      size: Size(200, 100), // Image radius
                                      child: Image.network(
                                        "https://img.game-news24.com/2021/10/Among-Us-Console-Edition-From-Tomorrow-Than-Expected.jpeg",
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        width: 320,
                      ),
                    ],
                  ),
                ),
                width: 350,
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  border:
                  Border.all(color: AppColors.backgroundcolor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.backgroundcolor2,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.arrow_circle_up_outlined),
                                      Text("76"),
                                      Icon(Icons.arrow_circle_down_outlined),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://pbs.twimg.com/media/EjJQLeLWkAE-RXF.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  backgroundColor: AppColors.backgroundcolor2,
                                  radius: 20,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "i/AmogGeeks",
                                    style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(2.0),
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      'New Sci-Fi movie AmogTheSpaceMan was great again!!!',
                                      style: TextStyle(
                                          color: AppColors.textcolor2),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white24,
                                    ),
                                    width: 210,
                                  ),
                                  SizedBox(height: 5),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        20), // Image border
                                    child: SizedBox.fromSize(
                                      size: Size(200, 100), // Image radius
                                      child: Image.network(
                                        "http://ictmedia.com.tr/Media/News/9765.jpg",
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        width: 320,
                      ),
                    ],
                  ),
                ),
                width: 350,
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  border:
                  Border.all(color: AppColors.backgroundcolor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.backgroundcolor2,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.arrow_circle_up_outlined),
                                      Text("55"),
                                      Icon(Icons.arrow_circle_down_outlined),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://i.pinimg.com/474x/b0/63/98/b0639897a0248b50cebee54e6908e4bb.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  backgroundColor: AppColors.backgroundcolor2,
                                  radius: 20,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "i/Amogcute",
                                    style: TextStyle(
                                        color: AppColors.textcolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(2.0),
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      'Are you so cute too!!! I am too cute kawai uwu!!! ',
                                      style: TextStyle(
                                          color: AppColors.textcolor2),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white24,
                                    ),
                                    width: 210,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        width: 320,
                      ),
                    ],
                  ),
                ),
                width: 350,
              ),
            ]),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      resizeToAvoidBottomInset: false,
    );
  }
}

class FeedModel {
  final String subname;
  final String message;
  final String time;
  final String vote;
  final String image;
  final String avatarUrl;

  FeedModel({required this.subname, required this.message, required this.time, required this.vote, required this.image, required this.avatarUrl});
}

List<FeedModel> feedData = [
  FeedModel(
      subname: "i/Amogdrip",
      message: "Amongus Drip Vcdoded will eventually decrease.",
      time: "21:13",
      vote: "243",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQPVQnqNXXsWAVKGXH4UrwtNLqC2S5kfI8ug&usqp=CAU",
      avatarUrl:
      "https://m.media-amazon.com/images/I/316sTqrlXEL._AC_SY780_.jpg"),
  FeedModel(
      subname: "i/AskAmong",
      message: "What will be the changes in nowadays muders???",
      time: "14:56",
      vote: "23",
      image: " ",
      avatarUrl:
      "https://i.pinimg.com/236x/db/b3/9d/dbb39d8f7713c3e160754de3bd709ca3.jpg"),
  FeedModel(
      subname: "i/AskAmong",
      message: "What will be the changes in nowadays muders???",
      time: "14:56",
      vote: "23",
      image: " ",
      avatarUrl:
      "https://i.pinimg.com/236x/db/b3/9d/dbb39d8f7713c3e160754de3bd709ca3.jpg"),
  FeedModel(
      subname: "i/AmogNews",
      message: "Today news on AmongNews...",
      time: "9:00",
      vote: "36",
      image: "https://img.game-news24.com/2021/10/Among-Us-Console-Edition-From-Tomorrow-Than-Expected.jpeg",
      avatarUrl:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJJmqSGd5IdcQuqo9UxLnw3GUQwnUqKXlUtQ&usqp=CAU"),
  FeedModel(
      subname: "i/AmogGeeks",
      message: "New Sci Fi movie AmogTheSpaceMan was great again!!!",
      time: "20:01",
      vote: "76",
      image: "http://ictmedia.com.tr/Media/News/9765.jpg",
      avatarUrl:
      "https://pbs.twimg.com/media/EjJQLeLWkAE-RXF.jpg"),
  FeedModel(
      subname: "i/Amogcute",
      message: "Are you so cute too!!! I am too cute kawai uwu!!!",
      time: "16:34",
      vote: "55",
      image: " ",
      avatarUrl:
      "https://i.pinimg.com/474x/b0/63/98/b0639897a0248b50cebee54e6908e4bb.jpg"),
];


*/

/*List<Widget> list = feed_items
    .map((e) => Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.backgroundcolor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: AppColors.backgroundcolor2,
          ),
          child: Row(
            children: [
              Container(
                child: Column(
                  children: [
                    IconButton(
                        iconSize: 25,
                        onPressed: () {},
                        icon: Icon(Icons.arrow_circle_up_outlined)),
                    Text(e.vote.toString()),
                    IconButton(
                        iconSize: 25,
                        onPressed: () {},
                        icon: Icon(Icons.arrow_circle_down_outlined)),
                  ],
                ),
              ),
              CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    e.avatarUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                backgroundColor: AppColors.backgroundcolor2,
                radius: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.username + " ● " + e.getDifference(DateTime.now()),
                      style: TextStyle(
                          color: AppColors.textcolor,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Text(
                        e.message,
                        style: TextStyle(color: AppColors.textcolor2),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white24,
                      ),
                      width: 200,
                    ),
                    SizedBox(height: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                        size: Size(150, 100), // Image radius
                        child: Image.network(
                          e.image,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
          width: 375,
        ))
    .toList()
    .reversed
    .toList();*/

