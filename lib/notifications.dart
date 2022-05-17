import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(0, 72, 144, 1),
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            child: ClipOval(
              child: Image.network("https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552", fit: BoxFit.cover,),
            ),
            backgroundColor: Colors.white,
            radius: 100,
          ),
        ),
        leadingWidth: 80,
      ),
      body: Scaffold(
        body: Align(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromRGBO(64, 118, 172, 1),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Today", style: TextStyle(color: Colors.white, fontSize: 20),),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.network("https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552", fit: BoxFit.cover,),
                          ),
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("i/AmogSU ● Just now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              Container(
                                child: Text('amogsu posted a new post: "Hello everyone! This is my first post."', style: TextStyle(color: Colors.white70),),
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
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.network("https://www4.minijuegosgratis.com/v3/games/thumbnails/238179_7_sq.jpg", fit: BoxFit.cover,),
                          ),
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("i/Sussusamogus ● 30 min", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              Container(
                                child: Text('sussusamogus posted a new post: "Thats pretty sus if you ask me bro."', style: TextStyle(color: Colors.white70),),
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
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.network("https://www4.minijuegosgratis.com/v3/games/thumbnails/237101_7_sq.jpg", fit: BoxFit.cover,),
                          ),
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("i/Amogdrip ● 1 h", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              Container(
                                child: Text('amogdrip posted a new post: "Among Drip Vocoded To Gangstas Paradise."', style: TextStyle(color: Colors.white70),),
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
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.network("https://www4.minijuegosgratis.com/v3/games/thumbnails/236338_7_sq.jpg", fit: BoxFit.cover,),
                          ),
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("i/Amog-stuff ● 2.5 h", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              Container(
                                child: Text('amog-stuff posted a new post: "Im stuff"', style: TextStyle(color: Colors.white70),),
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
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.network("https://i1.sndcdn.com/artworks-glpAGZyW52r2SyC5-0yCE2Q-t500x500.jpg", fit: BoxFit.cover,),
                          ),
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("i/Amogus2013 ● 3 h", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              Container(
                                child: Text('amogus2013 posted a new post: "Can we focus on finding the impostor?"', style: TextStyle(color: Colors.white70),),
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
            height: 600,
          ),
          alignment: Alignment.topCenter,
        ),
        backgroundColor: Color.fromRGBO(25, 25 ,25, 1)
      ),
    );
  }
}