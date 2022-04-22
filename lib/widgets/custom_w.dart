import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SizedBox buildSizedBox(
    {required BuildContext context,
    required String image,
    required String title,
    required String taskCount,
    required Color backgroundColor,
    required Color color,
    required VoidCallback callback}) {
  return SizedBox(
    width: 160.0,
    height: 200.0,
    child: InkWell(
      // onTap: () {
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => Todotask()));
      // },
      onTap: callback,
      child: Card(
        color: Colors.white,
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                child: Image.asset(
                  // "assets/ic_user.png",
                  image,
                  height: 40,
                  width: 40,
                  color: color,
                ),
                radius: 40,
                backgroundColor: backgroundColor,
              ),
              const SizedBox(height: 12),
              Text(
                // "Personal",
                title,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              Text(
                taskCount,
                // "25 Tasks",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 16.0),
              ),
            ],
          ),
        )),
      ),
    ),
  );
}
