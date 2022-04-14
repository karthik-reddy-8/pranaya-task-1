// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'myhomepage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Flutter App",
            textAlign: TextAlign.center,
          )),
        ),
        body: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: MyHomePage(),
          title: const Text(
            'Get Started',
            textScaleFactor: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ));
  }
}
