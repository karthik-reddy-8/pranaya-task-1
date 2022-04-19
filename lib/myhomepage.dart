import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_task/signup.dart';

import 'dashboard.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User? result = FirebaseAuth.instance.currentUser;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final DatabaseReference dbref =
      // ignore: deprecated_member_use
      FirebaseDatabase.instance.reference().child("users");

  bool showPassword = true;
  late FocusNode passwordFocusNode;

  @override
  // ignore: must_call_super
  void initState() {
    passwordFocusNode = FocusNode();
  }

  @override
  // ignore: must_call_super
  void dispose() {
    passwordFocusNode.dispose();
  }

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login to the app"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        fontSize: 11,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      hintText: 'Email/User name',
                      labelText: "Email/User name",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'user name should not be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    focusNode: passwordFocusNode,
                    onTap: () {
                      setState(() {
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      });
                    },
                    controller: _password,
                    obscureText: showPassword,
                    maxLength: 8,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        fontSize: 11,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      hintText: 'Enter Password',
                      suffixIcon: IconButton(
                        icon: Icon(showPassword
                            ? Icons.visibility_off
                            : Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                      labelText: 'Password',
                      counterText: "",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'new password should not be empty';
                      } else if (value.length < 8) {
                        return 'password must be 8 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => Signup()));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //ignore: deprecated_member_use
                      RaisedButton(
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          child: const Text("Login"),
                          onPressed: () {
                            // logInToFb();
                            if (_formkey.currentState!.validate()) {
                              logInToFb();
                            } else {
                              print("Failed");
                            }
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void logInToFb() {
    firebaseAuth
        .signInWithEmailAndPassword(
            email: _email.text, password: _password.text)
        .then((result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
}
