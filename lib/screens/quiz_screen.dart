import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/constants.dart';
import 'package:flutter_application_2/screens/result_screen.dart';
import 'package:flutter_application_2/utility/go_to_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int showQuestionList = 0;
  bool enableResultButton = false;
  int correctAnswer = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _Body()),
      appBar: _AppBarQuizScreen(),
    );
  }

  _AppBarQuizScreen() => AppBar(
        title:
            Text("سوال ${showQuestionList + 1} از ${getQuestionList().length}"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      );

  _Body() => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Image(
              image:
                  AssetImage(getQuestionList()[showQuestionList].ImageNumber),
              height: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              getQuestionList()[showQuestionList].Title,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            ...List.generate(4, (index) => _getOptionsItem(index)),
            if (enableResultButton)
              ElevatedButton(
                onPressed: () {
                  GoToScreen(context, ResultScreen(correctAnswer: correctAnswer,));
                },
                child: Text(
                  "نمایش نتایج بازی",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red, minimumSize: Size(200, 50)),
              ),
          ],
        ),
      );

  _getOptionsItem(int index) => ListTile(
        title: Text(
          getQuestionList()[showQuestionList].answerList[index],
          textAlign: TextAlign.end,
        ),
        onTap: () {
          if (showQuestionList < getQuestionList().length - 1)
            setState(() {
              (getQuestionList()[showQuestionList].correctAnswer == index)
                  ? correctAnswer++
                  : print("no");
              showQuestionList++;
            });
          else
            setState(() {
              enableResultButton = true;
            });
        },
      );
}
