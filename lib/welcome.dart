import 'package:flutter/material.dart';
import 'package:cs310_project/util/colors.dart';
import 'package:cs310_project/util/dimensions.dart';
import 'package:cs310_project/util/styles.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Welcome(),
    );
  }
}
class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        maintainBottomViewPadding: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: Dimen.regularPadding,
                child: RichText(
                  text: TextSpan(
                    text: "Welcome to I-SUCIALIZE!",
                    style: kHeadingTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: "This is an app that people can gather and chat about any topic they like to talk about and share information via posts / chat. You can enjoy your time with others as long as you wish ! :)",
                        style: TextStyle(
                          //decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationThickness: 2.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          height: 1.5,
                          fontSize: 25,
                          fontFamily: 'Raleway',
                          decorationStyle: TextDecorationStyle.dashed,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network('https://i.picsum.photos/id/160/3200/2119.jpg?hmac=cz68HnnDt3XttIwIFu5ymcvkCp-YbkEBAM-Zgq-4DHE'),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Start by Signup',
                          style: kButtonLightTextStyle,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                      ),
                    ),
                  ),

                  SizedBox(width: 8.0,),

                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () {
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Start by     Login',
                          style: kButtonDarkTextStyle,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
