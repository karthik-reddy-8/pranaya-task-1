import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'login_page.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late PickedFile _imageFile;
  final _picker = ImagePicker();

  Future getImage() async {
    final image = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      _imageFile = image!;
    });
  }

  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
    ConfirmpasswordFocusNode = FocusNode();
  }

  bool showPassword = true;
  bool showConfirmPassword = true;
  late FocusNode passwordFocusNode;
  // ignore: non_constant_identifier_names
  late FocusNode ConfirmpasswordFocusNode;
  // ignore: non_constant_identifier_names
  var err_msg;
  @override
  final TextEditingController _name = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _phone = TextEditingController();

  final TextEditingController _password = TextEditingController();

  // ignore: non_constant_identifier_names
  final TextEditingController _Confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final DatabaseReference dbref =
      FirebaseDatabase.instance.ref().child("users");
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text("Registration Form"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageProfile(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          fontSize: 11,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: 'User Name',
                        labelText: "Enter User Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'user name should not be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontSize: 11,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          hintText: 'Email/Gmail.com',
                          labelText: "Email/Gmail.com",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'email should not be empty';
                          }

                          return null;
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _phone,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          fontSize: 11,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: "Phone Number",
                        labelText: "Phone Number",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' phone no should not be empty';
                        }
                        if (value.length < 9) {
                          return 'enter valid phone no:';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _password,
                      focusNode: passwordFocusNode,
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context)
                              .requestFocus(passwordFocusNode);
                        });
                      },
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
                        labelText: "Password",
                        counterText: "",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' password should not be empty';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _Confirmpassword,
                      focusNode: ConfirmpasswordFocusNode,
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context)
                              .requestFocus(ConfirmpasswordFocusNode);
                        });
                      },
                      obscureText: showConfirmPassword,
                      maxLength: 8,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          fontSize: 11,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: 'confirm password',
                        suffixIcon: IconButton(
                          icon: Icon(showConfirmPassword
                              ? Icons.visibility_off
                              : Icons.remove_red_eye),
                          onPressed: () {
                            setState(() {
                              showConfirmPassword = !showConfirmPassword;
                            });
                          },
                        ),
                        labelText: "confirm password ",
                        counterText: "",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'confirm password should not be empty';
                        }
                        if (_password.text != _Confirmpassword.text) {
                          return 'password do not match';
                        }

                        return null;
                      },
                    ),
                  ),
                  Container(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // ignore: deprecated_member_use
                            RaisedButton(
                                color: Colors.green,
                                textColor: Colors.white,
                                child: Text("Submitt"),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    registerToFb();
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => loginPage()));
                                })
                          ])),
                ]),
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        const CircleAvatar(
          radius: 40,
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 25,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: 200,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            // ignore: deprecated_member_use
            FlatButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: const Text("Camera"),
            ),
            // ignore: deprecated_member_use
            FlatButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: const Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }

  void registerToFb() {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: _email.text, password: _password.text)
        .then((result) {
      dbref.child(result.user!.uid).set({
        "ename": _name.text,
        "email": _email.text,
        "phone": _phone.text,
        "password": _password.text,
        "confirmpassword": _Confirmpassword.text
        // "name": nameController.text
      });
    }).catchError((onError) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.black87,
        content: Text(
          'Registraion failed',
          style: TextStyle(color: Colors.white),
        ),
      ));
    });
  }
}
