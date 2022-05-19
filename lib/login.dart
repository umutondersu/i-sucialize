// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          body: Column(
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
                      'lib/assets/images/logo.png',
                      height: 300,
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
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromRGBO(0, 72, 144, 1),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    width: 360,
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              color: Color.fromRGBO(64, 118, 172, 1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                            ),
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            width: 275,
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
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              color: Color.fromRGBO(64, 118, 172, 1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                            ),
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            width: 235,
                            height: 200,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 50, 0, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromRGBO(0, 72, 144, 1),
                    ),
                    width: 150,
                    height: 75,
                    child: Center(
                      child: Text("Login",
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                    child: ClipOval(
                      child: Image.asset(
                        'lib/assets/images/google_icon.png',
                        height: 75,
                        width: 75,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                    child: ClipOval(
                      child: Image.asset(
                        'lib/assets/images/facebook_icon.png',
                        height: 75,
                        width: 75,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromRGBO(0, 72, 144, 1),
                    ),
                    width: 230,
                    height: 75,
                    child: Center(
                      child: Text("Register",
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                    ),
                    //child: ,
                  )
                ],
              ),
            ],
          ),
          backgroundColor: Color.fromRGBO(25, 25, 25, 1)),
    );
  }
}
