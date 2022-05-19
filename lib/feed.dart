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
        leadingWidth: 80,
      ),
        resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.backgroundcolor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.backgroundcolor2,
                    ),

                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                            Icons.arrow_circle_up_outlined
                                        ),
                                        Text(
                                            "23"
                                        ),
                                        Icon(
                                            Icons.arrow_circle_down_outlined
                                        ),
                                      ],
                                  )
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
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                                        child: 
                                        Text(
                                          'Amongus Drip Vcdoded will eventually decrease.',
                                          style:
                                          TextStyle(color: AppColors.textcolor2),
                                        ),

                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white24,
                                        ),
                                        width: 200,
                                        height: 40,
                                      ),
                                      SizedBox(height: 5),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10), // Image border
                                        child: SizedBox.fromSize(
                                          size: Size(200, 100), // Image radius
                                          child: Image.network(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQPVQnqNXXsWAVKGXH4UrwtNLqC2S5kfI8ug&usqp=CAU",
                                              fit: BoxFit.fill,

                                          ),
                                        ),
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
                    height: 200,

                  ),
                ]

              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.backgroundcolor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: AppColors.backgroundcolor2,
                      ),

                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                              Icons.arrow_circle_up_outlined
                                          ),
                                          Text(
                                              "23"
                                          ),
                                          Icon(
                                              Icons.arrow_circle_down_outlined
                                          ),
                                        ],
                                      )
                                  ),
                                  CircleAvatar(
                                    child: ClipOval(
                                      child: Image.network(
                                        "https://pbs.twimg.com/profile_images/1349164016640413698/OR4T6a49_400x400.png",
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
                                          "i/Amog-Stuff",
                                          style: TextStyle(
                                              color: AppColors.textcolor,
                                              fontWeight: FontWeight.bold),
                                        ),

                                        Container(
                                          child:
                                          Text(
                                            'I am a stuff guys, what should i do ?.',
                                            style:
                                            TextStyle(color: AppColors.textcolor2),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white24,
                                          ),
                                          width: 200,
                                          height: 50,
                                        ),
                                        SizedBox(height: 5),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10), // Image border
                                          child: SizedBox.fromSize(
                                            size: Size(200, 90), // Image radius
                                            child: Image.network(
                                              "https://static.wikia.nocookie.net/13592c08-d923-4f30-a28e-025a0ea6ecfe/scale-to-width/755",
                                              fit: BoxFit.fill,

                                            ),
                                          ),
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
                      height: 200,

                    ),
                  ]

              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.backgroundcolor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: AppColors.backgroundcolor2,
                      ),

                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                              Icons.arrow_circle_up_outlined
                                          ),
                                          Text(
                                              "23"
                                          ),
                                          Icon(
                                              Icons.arrow_circle_down_outlined
                                          ),
                                        ],
                                      )
                                  ),
                                  CircleAvatar(
                                    child: ClipOval(
                                      child: Image.network(
                                        "https://i.pinimg.com/736x/87/c1/88/87c188fd657f9d13e200f13c819694a6.jpg",
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
                                          "i/AmogAsk",
                                          style: TextStyle(
                                              color: AppColors.textcolor,
                                              fontWeight: FontWeight.bold),
                                        ),

                                        Container(
                                          child:
                                          Text(
                                            'What do you do first in the morning?.',
                                            style:
                                            TextStyle(color: AppColors.textcolor2),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white24,
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
                      height: 122,

                    ),
                  ]

              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.backgroundcolor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: AppColors.backgroundcolor2,
                      ),

                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                              Icons.arrow_circle_up_outlined
                                          ),
                                          Text(
                                              "23"
                                          ),
                                          Icon(
                                              Icons.arrow_circle_down_outlined
                                          ),
                                        ],
                                      )
                                  ),
                                  CircleAvatar(
                                    child: ClipOval(
                                      child: Image.network(
                                        "https://apkresult.com/Logos/among%20us%20apkresult.jpg",
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
                                          "i/AmogNews",
                                          style: TextStyle(
                                              color: AppColors.textcolor,
                                              fontWeight: FontWeight.bold),
                                        ),

                                        Container(
                                          child:
                                          Text(
                                            'Three new murders happened this morning in the amug Avenue!!!',
                                            style:
                                            TextStyle(color: AppColors.textcolor2),
                                          ),

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white24,
                                          ),
                                          width: 200,
                                          height: 50,
                                        ),
                                        SizedBox(height: 5),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10), // Image border
                                          child: SizedBox.fromSize(
                                            size: Size(200, 90), // Image radius
                                            child: Image.network(
                                              "https://img.game-news24.com/2021/10/Among-Us-Console-Edition-From-Tomorrow-Than-Expected.jpeg",
                                              fit: BoxFit.fill,

                                            ),
                                          ),
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
                      height: 200,

                    ),
                  ]

              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.backgroundcolor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: AppColors.backgroundcolor2,
                      ),

                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                              Icons.arrow_circle_up_outlined
                                          ),
                                          Text(
                                              "23"
                                          ),
                                          Icon(
                                              Icons.arrow_circle_down_outlined
                                          ),
                                        ],
                                      )
                                  ),
                                  CircleAvatar(
                                    child: ClipOval(
                                      child: Image.network(
                                        "https://w7.pngwing.com/pngs/74/355/png-transparent-whitty-among-us-crewmate-impostor-astronaut-space-character-game-imposter-bomb.png",
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
                                          "i/Amog-SciFi",
                                          style: TextStyle(
                                              color: AppColors.textcolor,
                                              fontWeight: FontWeight.bold),
                                        ),

                                        Container(
                                          child:
                                          Text(
                                            'Amogs Become Human such a nice movie...',
                                            style:
                                            TextStyle(color: AppColors.textcolor2),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white24,
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
                      height: 122,

                    ),
                  ]

              ),
            ],

          ),

          ),
        backgroundColor: Color.fromRGBO(25, 25, 25, 1)
    );
  }
}