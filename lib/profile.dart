import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(0, 72, 144, 1),
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(64, 118, 172, 1), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromRGBO(64, 118, 172, 1),
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text("Logout", style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
          ),
        ),
        leadingWidth: 120,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {

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
              children: [IconButton(
                onPressed: () {},
                icon: Icon(Icons.create_rounded),
                color: Colors.white,
              ),],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  child: ClipOval(
                    child: Image.network("https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552", fit: BoxFit.cover,),
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
                    border: Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  width: 200,
                  height: 40,
                  child: Center(
                    child: Text("AmogSU", style: TextStyle(color: Colors.white, fontSize: 20)) ,
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
                    border: Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 100,
                  height: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Followers", style: TextStyle(color: Colors.white, fontSize: 20),),
                      Text("420", style: TextStyle(color: Colors.white, fontSize: 20),),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 100,
                  height: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Following", style: TextStyle(color: Colors.white, fontSize: 20),),
                      Text("666", style: TextStyle(color: Colors.white, fontSize: 20),),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 100,
                  height: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Posts", style: TextStyle(color: Colors.white, fontSize: 20),),
                      Text("1", style: TextStyle(color: Colors.white, fontSize: 20),),
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
                    border: Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 350,
                  height: 200,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("About", style: TextStyle(color: Colors.white, fontSize: 20),),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromRGBO(64, 118, 172, 1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text("Very SUs.", style: TextStyle(color: Colors.white, fontSize: 16),),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 310,
                          height: 115,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],

        ),
        backgroundColor: Color.fromRGBO(25, 25 ,25, 1)
      ),
    );
  }
}