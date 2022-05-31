import 'package:i_sucialize/editprofile.dart';
import 'package:i_sucialize/feed.dart';
import 'package:i_sucialize/home.dart';
import 'package:i_sucialize/login.dart';
import 'package:i_sucialize/notifications.dart';
import 'package:i_sucialize/profile.dart';
import 'package:i_sucialize/register.dart';
import 'package:i_sucialize/search.dart';
import 'package:i_sucialize/walkthrough.dart';
import 'package:i_sucialize/welcome.dart';

var appRoutes = {
  '/': (context) => WalkthroughScreen(),
  '/welcome': (context) => Welcome(),
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/home': (context) => HomeScreen.asindex(0),
  '/profile': (context) => ProfileView(),
  '/profileedit': (context) => ProfileEditView(),
};
