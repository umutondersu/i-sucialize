// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_sucialize/home.dart';
import 'package:i_sucialize/notification_items.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:intl/intl.dart';

import 'databaseInterface.dart';

class NotificationsView extends StatefulWidget {
  NotificationsView({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _NotificationViewState();

}

class _NotificationViewState extends State<NotificationsView> {

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

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: databaseInterface.getAllNotifications(),

      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        getUserImage();
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Notifications'),
                centerTitle: true,
                elevation: 0,
                foregroundColor: AppColors.textcolor,
                backgroundColor: AppColors.primary,
              ),
              backgroundColor: Color.fromRGBO(25, 25, 25, 1));
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Notifications'),
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
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    backgroundColor: AppColors.primary,
                    radius: 100,
                  ),
                )),
            leadingWidth: 80,
          ),
          body: ListView.builder(
            itemCount: snapshot.data!.size,
            itemBuilder: (context, index) {
              DocumentSnapshot d = snapshot.data!.docs[index];

              print(d['userid']);

              return StreamBuilder(
                  stream: databaseInterface.getUser(d['userid']),
                  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> s2) {
                    if (s2.hasError) {
                    return const Text('Something went wrong');
                    }
                    if (s2.connectionState == ConnectionState.waiting ||
                    !s2.hasData) {
                    return Container();
                    }
                    DocumentSnapshot us = s2.data!;

                    //print(us);

                    return Container(
                      margin: EdgeInsets.fromLTRB(60, 10, 0, 0),
                      child: Row(
                      children: [
                        CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                            image,
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
                                us['username'] + " ● " + getDifference(d['date'].toDate()),
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Container(
                                child: Text(
                                  us['username'].toString().toLowerCase() +
                                  ' posted a new post: "' +
                                  d['post'] +
                                  '"',
                                  style: TextStyle(color: AppColors.textcolor2),
                                ),
                                width: 200,
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ],
                      ),
                      height: 70,
                      width: 320,
                    );
                }
              );
            },
          ),
          backgroundColor: Color.fromRGBO(25, 25, 25, 1),
        );

      }
    );


  }

}

/*Scaffold(
          body: Align(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.backgroundcolor2, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColors.backgroundcolor2,
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today",
                      style:
                          TextStyle(color: AppColors.textcolor, fontSize: 20),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: ClipOval(
                              child: Image.network(
                                "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
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
                                  "i/AmogSU ● Just now",
                                  style: TextStyle(
                                      color: AppColors.textcolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  child: Text(
                                    'amogsu posted a new post: "Hello everyone! This is my first post."',
                                    style:
                                        TextStyle(color: AppColors.textcolor2),
                                  ),
                                  width: 200,
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 70,
                      width: 320,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: ClipOval(
                              child: Image.network(
                                "https://www4.minijuegosgratis.com/v3/games/thumbnails/238179_7_sq.jpg",
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
                                  "i/Sussusamogus ● 30 min",
                                  style: TextStyle(
                                      color: AppColors.textcolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  child: Text(
                                    'sussusamogus posted a new post: "Thats pretty sus if you ask me bro."',
                                    style:
                                        TextStyle(color: AppColors.textcolor2),
                                  ),
                                  width: 200,
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 70,
                      width: 320,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: ClipOval(
                              child: Image.network(
                                "https://www4.minijuegosgratis.com/v3/games/thumbnails/237101_7_sq.jpg",
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
                                  "i/Amogdrip ● 1 h",
                                  style: TextStyle(
                                      color: AppColors.textcolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  child: Text(
                                    'amogdrip posted a new post: "Among Drip Vocoded To Gangstas Paradise."',
                                    style:
                                        TextStyle(color: AppColors.textcolor2),
                                  ),
                                  width: 200,
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 70,
                      width: 320,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: ClipOval(
                              child: Image.network(
                                "https://www4.minijuegosgratis.com/v3/games/thumbnails/236338_7_sq.jpg",
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
                                  "i/Amog-stuff ● 2.5 h",
                                  style: TextStyle(
                                      color: AppColors.textcolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  child: Text(
                                    'amog-stuff posted a new post: "Im stuff"',
                                    style:
                                        TextStyle(color: AppColors.textcolor2),
                                  ),
                                  width: 200,
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 70,
                      width: 320,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: ClipOval(
                              child: Image.network(
                                "https://i1.sndcdn.com/artworks-glpAGZyW52r2SyC5-0yCE2Q-t500x500.jpg",
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
                                  "i/Amogus2013 ● 3 h",
                                  style: TextStyle(
                                      color: AppColors.textcolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  child: Text(
                                    'amogus2013 posted a new post: "Can we focus on finding the impostor?"',
                                    style:
                                        TextStyle(color: AppColors.textcolor2),
                                  ),
                                  width: 200,
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 70,
                      width: 320,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: ClipOval(
                              child: Image.network(
                                "https://static.wikia.nocookie.net/amogus/images/6/68/2C85DAFB-CED6-40D2-8338-7B53A2224C2C.png/revision/latest?cb=20211123155833",
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
                                  "i/Frogus ● 4 h",
                                  style: TextStyle(
                                      color: AppColors.textcolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  child: Text(
                                    'frogus posted a new post: "ribbit ribbit ribbit"',
                                    style:
                                        TextStyle(color: AppColors.textcolor2),
                                  ),
                                  width: 200,
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 70,
                      width: 320,
                    ),
                  ],
                ),
              ),
              width: 350,
              height: MediaQuery.of(context).size.height * 0.73,
            ),
            alignment: Alignment.topCenter,
          ),
          backgroundColor: Color.fromRGBO(25, 25, 25, 1)),
        );*/
