// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        width: MediaQuery.of(context).size.width * 0.65,
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
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text("Register",
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),
    );
  }
}
