import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'login_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: Login(),
        title: Text(
          'وحدة التحول الرقمي',
          style: TextStyle(
              fontSize: 30,
              color: Colors.red,
              fontWeight: FontWeight.bold),
        ),
        image: Image.asset('images/logo1.jpg'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        loaderColor: Colors.blueAccent
    );
  }
}