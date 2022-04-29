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
    width: 170.0,
    height: 190.0,
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
            children: [
              CircleAvatar(
                child: Image.asset(
                  // "assets/ic_user.png",
                  image,
                  height: 30,
                  width: 30,
                  color: color,
                ),
                radius: 25,
                backgroundColor: backgroundColor,
              ),
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

ElevatedButton buildElevatedButton({
  required String title,
  required Color textColor,
  required Color iconColor,
  required VoidCallback voidCallback,
  required bool isVisible,
  required Color backGroundColor,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: backGroundColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isVisible)
          Icon(
            Icons.circle,
            color: iconColor,
            size: 17,
          ),
        const SizedBox(
          width: 7,
        ),
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ],
    ),
    onPressed: voidCallback,
  );
}
