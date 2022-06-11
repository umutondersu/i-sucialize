import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_sucialize/chat_screen.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      itemCount: GroupChat.length,
      itemBuilder: (context, i) =>  Column(
        children: <Widget>[
          Divider(
            height: 10.0,
          ),
          ListTile(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen(email: 'AmogSU@gmail.com',))),
            leading:  CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: AppColors.mainbackgroundcolor,
              backgroundImage:  NetworkImage(GroupChat[i].avatarUrl),
            ),
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  GroupChat[i].name,
                  style:  TextStyle(fontWeight: FontWeight.bold,color:AppColors.appBarTitleTextColor ),

                ),
                Text(
                  GroupChat[i].time,
                  style:  TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ],
            ),
            subtitle:  Container(
              padding: const EdgeInsets.only(top: 5.0),
              child:  Text(
                GroupChat[i].message,
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

List<ChatModel> GroupChat = [
  ChatModel(
      name: "SUspicious Group",
      message: "lol78@gmail.com: Very Sus guys :)",
      time: "10:34",
      avatarUrl:
      "https://scontent.fsaw3-1.fna.fbcdn.net/v/t1.6435-9/121105731_109147514298472_3606352789376792804_n.png?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=jYkJtjjCWMkAX_xBuC2&_nc_ht=scontent.fsaw3-1.fna&oh=00_AT-JQLhnK-31JyZxQADFpbj8Mlon_PpyyprHGD10a7-0Tg&oe=62C7CD61"),
];