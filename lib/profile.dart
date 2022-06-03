// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_sucialize/profileObject.dart';
import 'package:i_sucialize/util/colors.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              border: Border.all(color: AppColors.backgroundcolor2, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: AppColors.backgroundcolor2,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
        leadingWidth: 120,
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
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profileedit');
                    },
                    icon: Icon(Icons.create_rounded),
                    color: Colors.white,
                  ),
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
                        prof!.img,
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
                      child: Text(prof!.username.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20)),
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
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          prof!.followers.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          prof!.following.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          prof!.postCount.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: AppColors.backgroundcolor2,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                prof!.description.toString(),
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
  }
}
