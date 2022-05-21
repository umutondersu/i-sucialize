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
                      'lib/assets/images/1.png',
                      height: 290,
                      width: 290,
                    ),
                  )
                ],
              ),
              Row(
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.justify,
                                    decoration: InputDecoration(
                                      counter: null,
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                width: 255,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.justify,
                                    decoration: InputDecoration(
                                      counter: null,
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                width: 215,
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
                        child: Center(
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            child: ClipOval(
                              child: Image.asset(
                                'lib/assets/images/google_icon.png',
                                height: 75,
                                width: 75,
                              ),
                            ),
                          )),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
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
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromRGBO(0, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(0, 72, 144, 1),
                  ),
                  width: 230,
                  height: 75,
                  child: Center(
                      child: FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text("Register",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  )),
                  //child: ,
                ),
              ),
            ],
          ),
          backgroundColor: Color.fromRGBO(25, 25, 25, 1)),
    );
  }
}
