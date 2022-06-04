// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_sucialize/Authenticator.dart';
import 'package:i_sucialize/home.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:i_sucialize/profileObject.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Authenticator _authenticator = Authenticator();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Future<void> errDialog(
        {bool isEmail = false,
        bool isPassword = false,
        bool isIncorrect = false,
        bool isNotUser = false}) {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error while registering!',
                style: TextStyle(color: AppColors.textcolor2, fontSize: 20)),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  isEmail
                      ? Text('Invalid email address',
                          style: TextStyle(
                              color: AppColors.textcolor2, fontSize: 20))
                      : Text(''),
                  isPassword
                      ? Text('Please enter a password',
                          style: TextStyle(
                              color: AppColors.textcolor2, fontSize: 20))
                      : Text(''),
                  isIncorrect
                      ? Text('Password incorrect',
                          style: TextStyle(
                              color: AppColors.textcolor2, fontSize: 20))
                      : Text(''),
                  isNotUser
                      ? Text('A user with this email was not found',
                          style: TextStyle(
                              color: AppColors.textcolor2, fontSize: 20))
                      : Text(''),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok',
                    style:
                        TextStyle(color: AppColors.textcolor2, fontSize: 20)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            backgroundColor: AppColors.textColor,
          );
        },
      );
    }

    return Scaffold(
      body: Scaffold(
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromRGBO(0, 72, 144, 1),
                      ),
                      width: 230,
                      height: 50,
                      child: Center(
                        child: Text("Login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRect(
                      child: Image.asset(
                        'lib/assets/images/1.png',
                        height: 290,
                        width: 290,
                      ),
                    )
                  ],
                ),
                Row(
                  // Email
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromRGBO(0, 72, 144, 1),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Email",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromRGBO(0, 0, 0, 0),
                                        width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromRGBO(64, 118, 172, 1),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: TextField(
                                      controller: _emailController,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      textAlign: TextAlign.justify,
                                      decoration: InputDecoration(
                                        counter: null,
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 200,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  // Password
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromRGBO(0, 72, 144, 1),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          width: 360,
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromRGBO(0, 0, 0, 0),
                                        width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromRGBO(64, 118, 172, 1),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: TextField(
                                      controller: _passwordController,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      textAlign: TextAlign.justify,
                                      decoration: InputDecoration(
                                        counter: null,
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height: 200,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  // login buttons
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromRGBO(0, 72, 144, 1),
                          ),
                          width: 130,
                          height: 75,
                          child: TextButton(
                            onPressed: () {
                              if (_emailController.text.isEmpty) {
                                errDialog(isEmail: true);
                              } else {
                                if (_passwordController.text.isEmpty) {
                                  errDialog(isPassword: true);
                                } else {
                                  _authenticator
                                      .signIn(_emailController.text,
                                          _passwordController.text)
                                      .then((String uid) {
                                    setState(() async {
                                      if (uid == 'invalid-email') {
                                        errDialog(isEmail: true);
                                      } else if (uid == 'wrong-password') {
                                        errDialog(isIncorrect: true);
                                      } else if (uid == 'user-not-found') {
                                        errDialog(isNotUser: true);
                                      } else {
                                        getProfile(uid).then((prof) {
                                          //
                                        });
                                        final SharedPreferences
                                            sharedPreferences =
                                            await SharedPreferences
                                                .getInstance();
                                        sharedPreferences.setString(
                                            'email', _emailController.text);
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen.asindex(0)),
                                            (Route<dynamic> route) => false);
                                      }
                                    });
                                  });
                                }
                              }
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                signInWithGoogle()
                                    .then((UserCredential userCred) {
                                  setState(() {
                                    String? uid = userCred.user?.uid;
                                    Navigator.pushNamed(context, '/home');
                                  });
                                });
                              },
                              child: ClipOval(
                                child: Image.asset(
                                  'lib/assets/images/google_icon.png',
                                  height: 75,
                                  width: 75,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Center(
                  // register button
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromRGBO(0, 72, 144, 1),
                    ),
                    width: 230,
                    height: 75,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text("Register",
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromRGBO(25, 25, 25, 1)),
    );
  }
}
