import 'package:flutter/material.dart';
import 'package:i_sucialize/chat_screen.dart';
import 'package:i_sucialize/util/colors.dart';

class ChatHome extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return  ChatScreenState();
  }
}

class ChatScreenState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) =>  Column(
        children: <Widget>[
          Divider(
            height: 10.0,
          ),
          ListTile(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen(dummyData[i].name))),
            leading:  CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: AppColors.mainbackgroundcolor,
              backgroundImage:  NetworkImage(dummyData[i].avatarUrl),
            ),
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  dummyData[i].name,
                  style:  TextStyle(fontWeight: FontWeight.bold,color:AppColors.appBarTitleTextColor ),

                ),
                Text(
                  dummyData[i].time,
                  style:  TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ],
            ),
            subtitle:  Container(
              padding: const EdgeInsets.only(top: 5.0),
              child:  Text(
                dummyData[i].message,
                style:  TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel({required this.name, required this.message, required this.time, required this.avatarUrl});
}

List<ChatModel> dummyData = [
  ChatModel(
      name: "Umut Eren Örnek",
      message: "Hello friends",
      time: "10:34",
      avatarUrl:
      "https://i.picsum.photos/id/366/4000/3000.jpg?hmac=zphhHOH9ofToN2jNHd8z-nc98NrBd8y2okWXEXetLDg"),
  ChatModel(
      name: "Umut Şahin",
      message: "Hi when should we fix meeting",
      time: "6:20",
      avatarUrl:
      "https://i.picsum.photos/id/413/2666/1500.jpg?hmac=8RzTnqTaeObfKSBbRGVgeEFv2LwFRO0RwiEyOwXeTj0"),
  ChatModel(
      name: "Ata Sarıkaya",
      message: "Hi Umut",
      time: "7:40",
      avatarUrl:
      "https://i.picsum.photos/id/113/4168/2464.jpg?hmac=p1FqJDS9KHL70UWqUjlYPhJKBdiNOI_CIH0Qo-74_fU"),
  ChatModel(
      name: "Berk İnan",
      message: "Hello! :)",
      time: "1:10",
      avatarUrl:
      "https://i.picsum.photos/id/1041/5184/2916.jpg?hmac=TW_9o6HeD7H7I7NVo-S1Fa1iAvzQ10uvmJqsXvNoi0M"),
  ChatModel(
      name: "Nisa Defne Aksu",
      message: "Hello Berk can we talk if you are free",
      time: "4:00",
      avatarUrl:
      "https://i.picsum.photos/id/1025/4951/3301.jpg?hmac=_aGh5AtoOChip_iaMo8ZvvytfEojcgqbCH7dzaz-H8Y"),
  ChatModel(
      name: "AmogSU",
      message: "Ata can we have a chat?",
      time: "3:15",
      avatarUrl:
      "https://i.picsum.photos/id/271/4608/3072.jpg?hmac=KDcl52N6YZhhEOtJw5_z2H8Cc6I209G5w97Y7gn-Ks4"),
];