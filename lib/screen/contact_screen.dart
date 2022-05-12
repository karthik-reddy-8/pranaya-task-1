import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
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
          child: TextField(
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
      ]),
    );
  }
}
