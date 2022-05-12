import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task_3/components/new_conversation_contact.dart';

import '../models/message_model.dart';

class Conversation extends StatefulWidget {
  const Conversation({Key? key}) : super(key: key);

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
            color: Colors.white,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                Text(
                  "Cancel",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  "New Conversation",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text("To"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        hintText: "Type a name or phone number",
                        border: InputBorder.none),
                  )),
                  Icon(
                    Icons.dialpad,
                    color: Colors.black26,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.supervisor_account_rounded,
                    color: Colors.lightBlueAccent,
                  ),
                  SizedBox

                    width: 5,
                  ),
                  Text(
                    "Create a new Group",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: const [
                  Text(
                    "RECENTLY CONTACTED",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  )
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) => ContactList(
                            message: chats[index],
                          )))
            ])));
  }
}
