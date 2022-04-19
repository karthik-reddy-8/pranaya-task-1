import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_task/todotask.dart';

import 'addtask.dart';
import 'completed.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: AppBar(
            backgroundColor: Colors.blue,
            title: Row(children: [
              Column(children: const [
                Text(
                  "pranay",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Today you have 9 tasks",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ]),
            actions: [
              IconButton(
                icon: const Icon(Icons.video_label),
                onPressed: () {},
              ),
            ],
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              width: 120,
              height: 100,
              color: Colors.lightBlueAccent,
              child: const Text(
                "Today Remainders",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          const Text(
            "Projects",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[],
            ),
          ),
          /*const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text(
            "Today Remainder",
            style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),*/
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Wrap(spacing: 20, runSpacing: 20.0, children: <Widget>[
                SizedBox(
                  width: 160.0,
                  height: 160.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Todotask()));
                    },
                    child: Card(
                      color: Colors.white24,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/account.png"),
                              radius: 40,
                              backgroundColor: Colors.amberAccent,
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Personal",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 160.0,
                  height: 160.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Addtask()));
                    },
                    child: Card(
                        color: Colors.white24,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: const <Widget>[
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/work.png"),
                                radius: 40,
                                backgroundColor: Colors.lightGreenAccent,
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Work",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ]),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 160.0,
                  height: 160.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Completedtask()));
                    },
                    child: Card(
                      color: Colors.white24,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: const <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/meeting.png"),
                              radius: 40,
                              backgroundColor: Colors.pinkAccent,
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Meeting",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 160.0,
                  height: 160.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push;
                    },
                    child: Card(
                      color: Colors.white24,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const <Widget>[
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/shopping.png"),
                              radius: 40,
                              backgroundColor: Colors.amberAccent,
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Shopping",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ]));
  }

  /*imageProfile() {
    return Stack(children: [
      Container(
          width: 300.0,
          height: 500.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Colors.white, width: 2.0),
            image: DecorationImage(),
          ))
    ]);
  }*/
}
