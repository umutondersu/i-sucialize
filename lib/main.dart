import 'package:flutter/material.dart';
import 'package:i_sucialize/home.dart';
import 'package:i_sucialize/profile.dart';
import 'package:i_sucialize/routes.dart';

import 'home.dart';
import 'notifications.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: appRoutes,
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
        elevation: 1,
        foregroundColor: Colors.deepOrange,
        backgroundColor: Colors.tealAccent,
        shadowColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text(
          'Foobar',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
