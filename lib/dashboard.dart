import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_task/constants/strings.dart';
import 'package:flutter_todo_task/todotask.dart';
import 'package:flutter_todo_task/widgets/custom_w.dart';

import 'addtask.dart';

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
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(spacing: 20, runSpacing: 20.0, children: <Widget>[
                  buildSizedBox(
                    taskCount: strings.taskCount,
                    color: Colors.yellow,
                    callback: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Addtask()));
                    },
                    backgroundColor: Colors.yellow.shade100,
                    title: strings.personal,
                    context: context,
                    image: 'assets/ic_user.png',
                  ),
                  buildSizedBox(
                    taskCount: strings.taskCount,
                    color: Colors.green,
                    callback: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Todotask()));
                    },
                    backgroundColor: Colors.green.shade100,
                    title: strings.work,
                    context: context,
                    image: 'assets/work.png',
                  ),
                  buildSizedBox(
                    taskCount: strings.taskCount,
                    color: Colors.red,
                    callback: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Addtask()));
                    },
                    backgroundColor: Colors.red.shade100,
                    title: strings.meeting,
                    context: context,
                    image: 'assets/meeting.png',
                  ),
                  buildSizedBox(
                    taskCount: strings.taskCount,
                    color: Colors.orange,
                    callback: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Addtask()));
                    },
                    backgroundColor: Colors.orange.shade100,
                    title: strings.shopping,
                    context: context,
                    image: 'assets/shopping.png',
                  ),
                ]),
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
          child: IconButton(icon: Icon(Icons.add), onPressed: () {}),
          onPressed: () {}),
    );
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
