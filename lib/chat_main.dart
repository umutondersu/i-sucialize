import 'package:flutter/material.dart';
import 'package:i_sucialize/chat_home.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:i_sucialize/home.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainbackgroundcolor,
        appBar: AppBar(
          title: const Text('Chat'),
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
              )

          ),
          leadingWidth: 80,
        ),
        body: ChatHome()
    );
  }
}