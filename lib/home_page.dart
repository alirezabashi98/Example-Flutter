import 'dart:math';

import 'package:flutter/material.dart';

class GameAppliction extends StatefulWidget {
  const GameAppliction({Key? key}) : super(key: key);

  @override
  State<GameAppliction> createState() => _GameApplictionState();
}

class _GameApplictionState extends State<GameAppliction> {
  int top = 2;
  int bottom = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('سنگ  کاغذ  قیچی'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('images/$top.png'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  top = Random().nextInt(3) + 1;
                  bottom = Random().nextInt(3) + 1;
                });
              },
              child: Text(
                'شروع بازی',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
            ),
            Image(
              image: AssetImage('images/$bottom.png'),
            ),
          ],
        ),
      )),
    );
  }
}
