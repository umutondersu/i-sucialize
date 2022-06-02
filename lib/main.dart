import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_sucialize/home.dart';
import 'package:i_sucialize/profile.dart';
import 'package:i_sucialize/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:i_sucialize/walkthrough.dart';
import 'firebase_options.dart';
import 'package:i_sucialize/analytics_service.dart';
import 'package:i_sucialize/firebase_options.dart';
import 'package:get_it/get_it.dart';

import 'home.dart';
import 'notifications.dart';

GetIt locator = GetIt.instance;

void main() {
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();

  locator.registerLazySingleton<AnalyticsService>(() => AnalyticsService());

  runApp(const MyFirebaseApp());
}

class MyFirebaseApp extends StatefulWidget {
  const MyFirebaseApp({Key? key}) : super(key: key);

  @override
  _MyFirebaseAppState createState() => _MyFirebaseAppState();
}

class _MyFirebaseAppState extends State<MyFirebaseApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text(
                    'No Firebase Connection: ${snapshot.error.toString()}'),
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: MyApp(),
          );
        }
        return const MaterialApp(
          home: Center(
            child: Text('Connecting to Firebase'),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        locator<AnalyticsService>().getanalyticsObserver(),
      ],
      initialRoute: '/',
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

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Text('Connecting to Firebase',
          style: TextStyle(
            fontSize: 24,
          )),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  ErrorScreen({Key? key, required this.message}) : super(key: key);

  String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ERROR'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
