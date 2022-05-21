// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_sucialize/home.dart';
import 'package:i_sucialize/util/colors.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.backgroundcolor2, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.backgroundcolor2,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('lib/assets/images/1.png'),
                        Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Text(
                          "This logo is looking pretty sus!",
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
                    border:
                        Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  width: 130,
                  height: 50,
                  child: Center(
                    child: Text("Post",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: IconButton(
                    onPressed: () {},
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
        backgroundColor: Color.fromRGBO(25, 25, 25, 1));
  }
}
