// ignore_for_file: unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white,
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            "Flutter App",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          Image.asset(
            'assets/todo.jpg',
            height: 200,
            width: 400,
          ),
          Text("Remainders Made Simple",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
          Text(
            "Lorem ipsum dolor sit amet, consectetuar adipiscing elit. Mauris pellentesque erat in blandit luctus",
            textAlign: TextAlign.center,
          ),
          Container(
              height: 40,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ignore: deprecated_member_use
                    RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text("Get Started"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => MyHomePage()));
                      },
                    )
                  ]))
        ]));
  }
}
