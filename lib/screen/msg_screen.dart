import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task_3/models/message_model.dart';

import '../components/message_card.dart';
import '../models/message_model.dart';
import 'new_conversation.dart';

class MsgScreen extends StatefulWidget {
  const MsgScreen({Key? key}) : super(key: key);

  @override
  State<MsgScreen> createState() => _MsgScreenState();
}

class _MsgScreenState extends State<MsgScreen> {
  TextEditingController? _textEditingController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Colors.white,
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
          ),
          margin: const EdgeInsets.only(
            top: 15.0,
          ),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: const Icon(
                    CupertinoIcons.back,
                  ),
                  onPressed: () {}),
              const Text(
                "Messages",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  icon: const Icon(
                    CupertinoIcons.ellipsis,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
        SizedBox(
          height: 40.0,
          child: TextFormField(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Conversation()),
              );
            },
            // onChanged: (Value) {
            //   setState(() {
            //     chats =
            //         chats.where((element) => element.Msg(Value)).toList();
            //   });
            // },
            controller: _textEditingController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.all(10.0),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade400,
                ),
                hintText: "Search people..."),
          ),
        ),
        Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: chats.length,
                itemBuilder: (context, index) => MessageCard(
                      message: chats[index],
                    )))
      ]),
    );
  }
}
