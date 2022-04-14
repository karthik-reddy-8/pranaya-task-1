import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final DatabaseReference dbref =
      // ignore: deprecated_member_use
      FirebaseDatabase.instance.reference().child("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App"),
        backgroundColor: Colors.redAccent,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      body: ListView(
        children: <Widget>[
          const Text("Add Task"),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.tealAccent,
                child: Text("index: $index"),
              );
            },
          ),
          const Text("Todo task"),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.tealAccent,
                child: Text("index: $index"),
              );
            },
          ),
          const Text("Completed Task"),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.tealAccent,
                child: Text("index: $index"),
              );
            },
          ),
          const Text("Profile"),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.tealAccent,
                child: Text("index: $index"),
              );
            },
          )
        ],
      ),
    );
  }
}
