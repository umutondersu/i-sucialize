import 'package:flutter/material.dart';
import 'package:i_sucialize/util/colors.dart';

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
                                      Text("248"),
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
