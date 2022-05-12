import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';
import '../screen/chat_box.dart';

class ContactList extends StatefulWidget {
  const ContactList({
    Key? key,
    required this.message,
  }) : super(key: key);
  final Msg message;

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatBox()),
          );
        },
        child: Dismissible(
            key: Key(widget.message.time),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: SingleChildScrollView(
                    child: Row(children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(widget.message.sender.imageUrl),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          widget.message.sender.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.message.text,
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ])))));
  }
}
