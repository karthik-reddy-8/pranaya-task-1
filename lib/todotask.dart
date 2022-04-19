import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_task/completed.dart';

import 'addtask.dart';

class Todotask extends StatefulWidget {
  @override
  State<Todotask> createState() => _TodotaskState();
}

class _TodotaskState extends State<Todotask> {
  int SelectIndex = 0;

  final tabs = [Addtask(), Completedtask(), Todotask()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[SelectIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.8),
        selectedItemColor: Colors.white,
        currentIndex: SelectIndex,
        onTap: (index) => setState(() {
          SelectIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task,
              color: Colors.white,
            ),
            label: 'All tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.white,
              size: 28,
            ),
            label: 'On Going Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.backup_table_sharp,
              color: Colors.white,
              size: 28,
            ),
            label: 'Completed Tasks',
          ),
        ],
      ),
    );
  }
}
