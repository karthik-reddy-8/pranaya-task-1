import 'package:flutter/material.dart';

class Addtask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Todo Name"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  RaisedButton(
                    child: Text("Save"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }
}
