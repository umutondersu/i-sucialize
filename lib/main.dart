import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_sucialize/databaseInterface.dart';
import 'package:i_sucialize/home.dart';
import 'package:i_sucialize/profile.dart';
import 'package:i_sucialize/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:i_sucialize/walkthrough.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:i_sucialize/analytics_service.dart';
import 'package:i_sucialize/firebase_options.dart';
import 'home.dart';
import 'notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

GetIt locator = GetIt.instance;

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    locator.registerLazySingleton<AnalyticsService>(() => AnalyticsService());

    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    bool isWTdone = prefs.getBool('WT') ?? false;
    bool isLoggedIn = prefs.getString('email') == null ? false : true;
    late String initialRoute;

    if (isWTdone) {
      if (isLoggedIn) {
        databaseInterface = DatabaseInterface(uid: prefs.getString('uid') ?? "4lK7ZmibDTcY50rdiONRA22Gr6b2");
        initialRoute = '/home';
      } else {
        initialRoute = '/welcome';
      }
    } else {
      initialRoute = '/';
    }

    runApp(MyFirebaseApp(initialRoute: initialRoute));
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

/*
Future<void> main() async {
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();

  locator.registerLazySingleton<AnalyticsService>(() => AnalyticsService());

  final prefs = await SharedPreferences.getInstance();
  bool isWTdone = prefs.getBool('WT') ?? false;
  bool isLoggedIn = prefs.getString('email') == null ? false : true;
  late String initialRoute;

  if (isWTdone) {
    if (isLoggedIn) {
      initialRoute = '/home';
    }
    initialRoute = '/welcome';
  } else {
    initialRoute = '/';
  }

  runApp(MyFirebaseApp(initialRoute: initialRoute));
}
*/

class MyFirebaseApp extends StatefulWidget {
  final String initialRoute;
  const MyFirebaseApp({Key? key, required this.initialRoute}) : super(key: key);

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
            home: MyApp(initialRoute: widget.initialRoute),
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
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        locator<AnalyticsService>().getanalyticsObserver(),
      ],
      //iswalkthrough and islogin
      initialRoute: initialRoute,
      routes: appRoutes,
    );
  }
}

/*
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
*/

/*void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseCrashlytics.instance.crash();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyFirebaseApp());
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
            home: MyApp(initialRoute: widget.initialRoute),
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
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [

      ],
      //iswalkthrough and islogin
      initialRoute: initialRoute,
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

  int? firstLoad;
  SharedPreferences? prefs;

  decideRoute() async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      firstLoad = (prefs!.getInt('appInitialLoad') ?? 0);
    });
  }

  @override
  void initState(){
    super.initState();
    decideRoute();
  }

  @override
  Widget build(BuildContext context){
    if(firstLoad == null){
      return Container();
    } else if (firstLoad == 0){
      firstLoad = 1;
      prefs!.setInt('appInitialLoad', firstLoad!);
      return MaterialApp(
        home: WalkthroughScreen(),
      );
    } else{
       return MaterialApp(
        home: HomeScreen.asindex(0),
       );
      }
    }
  }

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseCrashlytics.instance.crash();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyFirebaseApp());
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
  void _firebaseCrash() async{
    if (kDebugMode) {
      // Force disable Crashlytics collection while doing every day development.
      // Temporarily toggle this to true if you want to test crash reporting in your app.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    }

    else {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }

  }
  @override
  void initState(){
    _firebaseCrash();
    super.initState();
  }
*/