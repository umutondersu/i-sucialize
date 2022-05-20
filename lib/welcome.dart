import 'package:flutter/material.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:i_sucialize/util/dimensions.dart';
import 'package:i_sucialize/util/styles.dart';

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
      backgroundColor: AppColors.mainbackgroundcolor,
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
                    text: "",
                    style: kHeadingTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: "Welcome to I-SUCIALIZE!",
                        style: TextStyle(
                          //decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationThickness: 2.0,
                          fontStyle: FontStyle.italic,
                          color: AppColors.primary,
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
              child: Image.asset('lib/assets/images/1.png'),
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
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Start by Signup',
                          style: kButtonLightTextStyle,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.headingColor,
                      ),
                    ),
                  ),

                  SizedBox(width: 8.0,),

                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Start by Login',
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
