import 'package:flutter/material.dart';
import 'package:i_sucialize/chat_home.dart';
import 'package:i_sucialize/util/colors.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Chat App",
      home: new HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: AppColors.mainbackgroundcolor,
        appBar: new AppBar(
          backgroundColor: AppColors.primary,
          title: new Text("I-SUcialize"),
        ),
        body: new ChatHome()
    );
  }
}