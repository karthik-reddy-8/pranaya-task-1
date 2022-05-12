import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatInputFeild extends StatelessWidget {
  const ChatInputFeild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadiusDirectional.circular(40),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.image,
                        color: Colors.black26,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "|",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            hintText: "type something",
                            border: InputBorder.none),
                      )),
                      Icon(
                        Icons.mic_none,
                        color: Colors.black26,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.send_rounded,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
