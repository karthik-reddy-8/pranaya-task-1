import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int thememode = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  starting() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getInt("thememode") != null) {
      thememode = pref.getInt("thememode")!;
    } else {
      pref.setInt("thememode", thememode);
    }
    setState(() {});
  }

  toggletheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getInt("thememode") == 1) {
      pref.setInt("thememode", 0);
      thememode = 0;
    } else {
      pref.setInt("thememode", 1);
      thememode = 1;
    }
    print("thememode :" + thememode.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: kIsWeb
          ? Container(width: 400, child: Home(() => toggletheme(), thememode))
          : Home(() => toggletheme(), thememode),
      theme: ThemeData(
        primaryColor: Colors.black87,
        cardColor: Colors.white,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.grey,
        cardColor: Colors.grey,
      ),
      themeMode: thememode == 1 ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
