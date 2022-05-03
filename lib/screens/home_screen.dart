import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: _AppBarHomeScreen(),
        body: SafeArea(
          child: Center(
            child: Text("Quiz")
          ),
        ),
      ),
    );
  }

  _AppBarHomeScreen() => AppBar(
        title: Text("Quiz"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[900],
      );
}
