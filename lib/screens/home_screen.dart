import 'package:flutter/material.dart';
import 'package:flutter_application_2/utility/go_to_screen.dart';

import 'quiz_screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppBarHomeScreen(),
      body: SafeArea(child: _Body()),
    );
  }

  _AppBarHomeScreen() => AppBar(
        title: Text("Quiz"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      );

  _Body() => Column(
        children: [
          Image(
            image: AssetImage('images/welcome.png'),
          ),
          ElevatedButton(
            onPressed: () {
              GoToScreen(context, QuizScreen());
            },
            child: Text(
              'شروع بازی',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent[800],
              minimumSize: Size(200, 40),
            ),
          )
        ],
      );
}
