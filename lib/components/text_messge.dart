import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message1,
  }) : super(key: key);

  final Msg message1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent.shade100
            .withOpacity(message1.sentRecieveMsg.isSent ? 1 : 0.3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        message1.text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
