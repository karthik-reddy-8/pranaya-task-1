import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class AudioMessage extends StatelessWidget {
  final Msg message;
  const AudioMessage({Key? key, required Msg message1, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent.shade100
            .withOpacity(message.sentRecieveMsg.isSent ? 1 : 0.3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.play_arrow,
            color: Colors.green,
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      )
                    ])),
          ),
          Text("0.4"),
        ],
      ),
    );
  }
}
