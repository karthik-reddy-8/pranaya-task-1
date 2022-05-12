import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/chat_body.dart';

class ChatBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ChatBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.navigate_before, color: Colors.black),
            onPressed: () {},
          ),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/alone.jpg"),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Md Jahid",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "Online",
                style: TextStyle(fontSize: 13, color: Colors.green),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone, color: Colors.black54),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.videocam, color: Colors.black54),
          onPressed: () {},
        ),
      ],
    );
  }
}
