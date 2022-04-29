import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todo_task/signup.dart';

import 'dashboard.dart';

class loginPage extends StatefulWidget {
  @override
  loginPageState createState() => loginPageState();
}

class loginPageState extends State<loginPage> {
  User? result = FirebaseAuth.instance.currentUser;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final DatabaseReference dbref =
      FirebaseDatabase.instance.reference().child("users");

  bool showPassword = true;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
  }

  final TextEditingController _email =
      TextEditingController(text: 'pranay@gmail.com');

  final TextEditingController _password =
      TextEditingController(text: 'PR@nay@1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.lightBlueAccent,
              Colors.lightBlue,
            ], begin: Alignment.topLeft, end: Alignment.centerRight),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 36.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Todo",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 46.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Enter to your World",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _email,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.grey[300],
                                hintText: "E-mail",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.grey[500],
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'email should not be empty';
                              }

                              return null;
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          focusNode: passwordFocusNode,
                          onTap: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              FocusScope.of(context)
                                  .requestFocus(passwordFocusNode);
                            });
                          },
                          controller: _password,
                          obscureText: showPassword,
                          maxLength: 8,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[300],
                            hintText: "password",
                            counterText: " ",
                            prefixIcon: IconButton(
                              icon: Icon(showPassword
                                  ? Icons.lock_outline
                                  : Icons.lock_open_sharp),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            ),
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
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          child: RaisedButton(
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              onPressed: () {
                                // logInToFb();
                                if (_formkey.currentState!.validate()) {
                                  logInToFb();
                                } else {
                                  print("Failed");
                                }
                              }),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup()),
                                  );
                                },
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Dont have an account? ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                40,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                        text: 'Sign up',
                                        style: TextStyle(
                                          color: Colors.pinkAccent,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              40,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ]),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
        MaterialPageRoute(builder: (context) => const Dashboard()),
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
