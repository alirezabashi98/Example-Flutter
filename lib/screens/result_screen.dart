import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, this.correctAnswer = 0}) : super(key: key);
  int correctAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarResultScreen(),
      body: SafeArea(
        child: _Body(),
      ),
    );
  }

  _AppBarResultScreen() => AppBar(
        title: Text("نتیجه آزمون"),
        centerTitle: true,
        backgroundColor: Colors.red[800],
      );

  _Body() => Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Image(image: AssetImage('images/cup.png')),
          ),
          Text(
            'پاسخ های صحیح شما',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Text(
            '$correctAnswer',
            style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      );
}
