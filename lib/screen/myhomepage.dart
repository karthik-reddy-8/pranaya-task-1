import 'package:flutter/material.dart';
import 'package:task_3/screen/call_screen.dart';
import 'package:task_3/screen/contact_screen.dart';

import 'msg_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int screenIndex = 0;

  final screens = [
    const MsgScreen(),
    const CallScreen(),
    const ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screenIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
          enableFeedback: false,
          onPressed: () {
            setState(() {
              screenIndex = 0;
            });
          },
          icon: screenIndex == 0
              ? const Icon(
                  Icons.message,
                  color: Colors.blue,
                  size: 35,
                )
              : const Icon(
                  Icons.message_outlined,
                  color: Colors.blue,
                  size: 35,
                ),
        ),
        IconButton(
          enableFeedback: false,
          onPressed: () {
            setState(() {
              screenIndex = 1;
            });
          },
          icon: screenIndex == 1
              ? const Icon(
                  Icons.call,
                  color: Colors.blue,
                  size: 35,
                )
              : const Icon(
                  Icons.call_outlined,
                  color: Colors.blue,
                  size: 35,
                ),
        ),
        IconButton(
          enableFeedback: false,
          onPressed: () {
            setState(() {
              screenIndex = 2;
            });
          },
          icon: screenIndex == 2
              ? const Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 35,
                )
              : const Icon(
                  Icons.person_outline_sharp,
                  color: Colors.blue,
                  size: 35,
                ),
        ),
      ]),
    );
  }
}
