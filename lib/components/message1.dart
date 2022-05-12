import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_3/components/text_messge.dart';

import '../models/message_model.dart';
import 'audio_message.dart';

class Message1 extends StatelessWidget {
  const Message1({
    required Key key,
    required this.message1,
  }) : super(key: key);
  final Msg message1;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(Msg message1) {
      switch (message1.sentRecieveMsg.msgType) {
        case "text":
          return TextMessage(message1: message1);
        case "audio":
          return AudioMessage(
            message: message1,
            message1: message1,
          );

        default:
          return const SizedBox();
      }
    }

    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
            mainAxisAlignment: message1.sentRecieveMsg.isSent
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              if (!message1.sentRecieveMsg.isSent) ...[
                const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/alone.jpg"),
                ),
                const SizedBox(
                  width: 7,
                ),
                messageContaint(message1),
              ] else
                Positioned(
                    right: 0,
                    child: Row(
                      children: [
                        messageContaint(message1),
                        const CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage("assets/smile.png"),
                        ),
                      ],
                    )),
            ]));
  }
}
