import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_3/components/chat_input__feild.dart';

import '../models/message_model.dart';
import 'message1.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.8),
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) => Message1(
              message1: chats[index],
              key: Key(chats[index].time),
            ),
          ),
        ),
      ),
      const ChatInputFeild(),
    ]));
  }
}
