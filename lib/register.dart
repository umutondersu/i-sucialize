// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_sucialize/util/colors.dart';

import 'Authenticator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  final Authenticator _authenticator = Authenticator();

  Future<void> errDialog({
    bool isUsername = false,
    bool isEmail = false,
    bool isPassword = false,
    bool isConfirm = false,
    bool isNotConfirmed = false,
    bool isWeak = false,
    bool isInUse = false}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error while registering!',
              style: TextStyle(color: AppColors.textcolor2, fontSize: 20)
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                isUsername ? Text('Please enter a username',
                    style: TextStyle(color: AppColors.textcolor2, fontSize: 20)
                ) : Text(''),
                isEmail ? Text('Invalid email address',
                    style: TextStyle(color: AppColors.textcolor2, fontSize: 20)
                ) : Text(''),
                isPassword ? Text('Please enter a password',
                    style: TextStyle(color: AppColors.textcolor2, fontSize: 20)
                ) : Text(''),
                isConfirm ? Text('Please confirm the password',
                    style: TextStyle(color: AppColors.textcolor2, fontSize: 20)
                ) : Text(''),
                isNotConfirmed ? Text('Please check if the passwords match',
                    style: TextStyle(color: AppColors.textcolor2, fontSize: 20)
                ) : Text(''),
                isWeak ? Text('Please enter a stronger password',
                    style: TextStyle(color: AppColors.textcolor2, fontSize: 20)
                ) : Text(''),
                isInUse ? Text('Email is already in use',
                    style: TextStyle(color: AppColors.textcolor2, fontSize: 20)
                ) : Text(''),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok',
                  style: TextStyle(color: AppColors.textcolor2, fontSize: 20)
              ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  width: 230,
                  height: 50,
                  child: Center(
                    child: Text("Register",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  //child: ,
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
                    height: 200,
                    width: 300,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromRGBO(64, 118, 172, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: TextField(
                              controller: _usernameController,
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.justify,
                              decoration: InputDecoration(
                                counter: null,
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 200,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromRGBO(64, 118, 172, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: TextField(
                              controller: _emailController,
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.justify,
                              decoration: InputDecoration(
                                counter: null,
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 200,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromRGBO(64, 118, 172, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.justify,
                              decoration: InputDecoration(
                                counter: null,
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 200,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Confirm\nPassword",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromRGBO(64, 118, 172, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: TextField(
                              controller: _passwordConfirmController,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.justify,
                              decoration: InputDecoration(
                                counter: null,
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          width: MediaQuery.of(context).size.width * 0.63,
                          height: 200,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 18, 0, 0),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  width: 230,
                  height: 75,
                  child: TextButton(
                    onPressed: () {
                      if (_usernameController.text.isEmpty) {
                        errDialog(isUsername: true);
                      }
                      else {
                        if (_emailController.text.isEmpty) {
                          errDialog(isEmail: true);
                        }
                        else {
                          if (_passwordController.text.isEmpty) {
                            errDialog(isPassword: true);
                          }
                          else {
                            if (_passwordConfirmController.text.isEmpty) {
                              errDialog(isConfirm: true);
                            }
                            else {
                              if (_passwordController.text == _passwordConfirmController.text) {
                                _authenticator.signUp(_emailController.text, _usernameController.text, _passwordController.text).then((String? uid) {
                                  setState(() {
                                    if (uid == 'invalid-email') {
                                      errDialog(isEmail: true);
                                    } else if (uid == 'weak-password') {
                                      errDialog(isWeak: true);
                                    } else if (uid == 'email-already-in-use') {
                                      errDialog(isInUse: true);
                                    } else {
                                      Navigator.pushNamed(context, '/login');
                                    }
                                  });
                                });

                              }
                              else {
                                errDialog(isNotConfirmed: true);
                              }
                            }
                          }
                        }
                      }
                    },
                    child: Text("Register",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),
    );
  }
}
