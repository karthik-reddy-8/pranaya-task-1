import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_todo_task/completed.dart';
import 'package:flutter_todo_task/constants/strings.dart';
import 'package:flutter_todo_task/todotask.dart';
import 'package:flutter_todo_task/widgets/custom_widgets.dart';

import 'addtask.dart';
import 'floor_db/database.dart';
import 'floor_db/model_class.dart';
import 'floor_db/todo_dao.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

TextEditingController taskController = TextEditingController();
final formKey = GlobalKey<FormState>();
TodoDatabase? database;
String? _errorMsg1;
String todoType = 'Personal';

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: AppBar(
            backgroundColor: Colors.blueAccent.shade200,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: InkWell(
                  onTap: () {},
                  // child: Image.network(
                  //   // "assets/ic_user.png",
                  //
                  //   image,
                  //   height: 40,
                  //   width: 40,
                  // ),
                ),
              ),
            ],
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
                //color: Colors.white30,
                child: Stack(children: [
              Positioned(
                  top: -10.0,
                  left: -10.0,
                  child: Container(
                    width: 100.0,
                    height: 85.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70.0),
                        topRight: Radius.circular(50.0),
                        bottomRight: Radius.circular(80.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                      color: Colors.white30,
                    ),
                  )),
              Positioned(
                  top: -20.0,
                  right: -30.0,
                  child: Container(
                    width: 100.0,
                    height: 85.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70.0),
                        topRight: Radius.circular(50.0),
                        bottomRight: Radius.circular(80.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                      color: Colors.white30,
                    ),
                  )),
              Positioned(
                  top: 100,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 120.0,
                    width: 400.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      color: Colors.white30,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Today Remainder",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Meeting with client",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "13:00pm",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ]),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.asset(
                                  'assets/images/ic_bell.png',
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(2),
                                  child: IconButton(
                                    icon: Icon(Icons.clear),
                                    iconSize: 20,
                                    onPressed: () {},
                                  )),
                            ],
                          )
                        ]),
                  )),
            ])),
          )),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Projects",
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.justify,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
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
                    image: 'assets/ic_work.png',
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
                    image: 'assets/ic_meeting.png',
                  ),
                  buildSizedBox(
                    taskCount: strings.taskCount,
                    color: Colors.orange,
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Completedtask()));
                    },
                    backgroundColor: Colors.orange.shade100,
                    title: strings.shopping,
                    context: context,
                    image: 'assets/ic_shopping.png',
                  ),
                ]),
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.elliptical(70, 70)),
                ),
                context: context,
                builder: ((builder) => bottomSheet()));
          }),
    );
  }
}

class bottomSheet extends StatefulWidget {
  const bottomSheet({Key? key}) : super(key: key);

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  bool _isTimeSelected = false;
  bool _isDateSelected = false;
  TimeOfDay currentTime = TimeOfDay.now();
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      transform: Matrix4.translationValues(0.0, -30, 0.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        color: Colors.white30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.pinkAccent,
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
                child: const Icon(
                  Icons.clear_rounded,
                  color: Colors.white,
                  size: 35,
                )),
          ),
          const Text(
            "Add new Task",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Form(
            key: formKey,
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: taskController,
              validator: (value) {
                if (value!.isEmpty) {
                  _errorMsg1 = "This field is required";
                  return _errorMsg1;
                } else {
                  return null;
                }
              },
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
                labelText: "Add your task",
                errorText: _errorMsg1,
              ),
            ),
          ),
          IntrinsicWidth(
            stepWidth: 300,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      buildElevatedButton(
                          textColor: todoType == 'Personal'
                              ? Colors.white
                              : Colors.black26,
                          voidCallback: () {
                            setState(() {
                              todoType = 'Personal';
                            });
                          },
                          isVisible: todoType == 'Personal' ? false : true,
                          iconColor: Colors.yellow,
                          title: strings.personal,
                          backGroundColor: todoType == 'Personal'
                              ? Colors.yellow
                              : Colors.white),
                      const SizedBox(
                        width: 10,
                      ),
                      buildElevatedButton(
                        textColor:
                            todoType == 'Work' ? Colors.white : Colors.black26,
                        voidCallback: () {
                          setState(() {
                            todoType = 'Work';
                          });
                        },
                        isVisible: todoType == 'Work' ? false : true,
                        iconColor: Colors.green,
                        title: strings.work,
                        backGroundColor:
                            todoType == 'Work' ? Colors.green : Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      buildElevatedButton(
                          textColor: todoType == 'Meeting'
                              ? Colors.white
                              : Colors.black26,
                          voidCallback: () {
                            setState(() {
                              todoType = 'Meeting';
                            });
                          },
                          isVisible: todoType == 'Meeting' ? false : true,
                          iconColor: Colors.pinkAccent,
                          title: strings.meeting,
                          backGroundColor: todoType == 'Meeting'
                              ? Colors.pinkAccent
                              : Colors.white),
                      const SizedBox(
                        width: 10,
                      ),
                      buildElevatedButton(
                          textColor: todoType == 'Shopping'
                              ? Colors.white
                              : Colors.black26,
                          voidCallback: () {
                            setState(() {
                              todoType = 'Shopping';
                            });
                          },
                          isVisible: todoType == 'Shopping' ? false : true,
                          iconColor: Colors.orange,
                          title: strings.shopping,
                          backGroundColor: todoType == 'Shopping'
                              ? Colors.orange
                              : Colors.white),
                    ]),
                  ),

                  const Divider(
                    color: Colors.black26,
                    thickness: 2,
                  ),

                  Row(children: const [
                    Text(
                      "Choose date",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ]),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          leading: Icon(Icons.timer),
                          trailing: Icon(Icons.edit),
                          title: _isTimeSelected
                              ? Text(
                                  '${currentTime.format(context).toString()}')
                              : Text('time'),
                          onTap: () {
                            selectTime(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Icon(Icons.calendar_today),
                          trailing: Icon(Icons.edit),
                          title: _isDateSelected
                              ? Text(
                                  '${currentDate.day} / ${currentDate.month} /${currentDate.year}')
                              : Text("Date"),
                          onTap: () {
                            selectDate(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                      ),
                      child: Text(
                        strings.addTask,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) =>
                        //         addTodo()));
                      }),
                ]),
          )
        ],
      ),
    );
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );
    if (pickedTime != null && pickedTime != currentTime) {
      setState(() {
        currentTime = pickedTime;
        _isTimeSelected = true;
      });
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1997, 01, 01),
      lastDate: DateTime(2030, 12, 31),
    );
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        _isDateSelected = true;
      });
    }
  }

  Future<void> addTodo() async {
    database =
        await $FloorTodoDatabase.databaseBuilder('tododatabase.db').build();
    TodoDAO? dao = database?.todoDAO;
    dao?.insertATodo(Todo(
      title: taskController.text,
      workType: todoType,
      completed: false,
    ));
    print('Title:- ${taskController.text}, workType:-$todoType ');
    Navigator.pop(context);
  }
}
