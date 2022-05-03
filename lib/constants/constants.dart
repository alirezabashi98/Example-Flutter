import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/Question.dart';
import 'package:hexcolor/hexcolor.dart';

final Color textGreen = HexColor('#38b387');
final Color textGrey = HexColor('#93a59e');
final Color backgroundGrey = HexColor('#2e3951');
final Color backgroundGreyDark = HexColor('#212b41');

final String DevName = 'AlirezaBashi';

List<Question> getQuestionList() => [
      Question(
        Title: 'مشهور ترین جادوگر دنیا کیست؟',
        ImageNumber: "images/1.png",
        answerList: [
          "ممد",
          "عباس",
          "امیر",
          "علی",
        ],
        correctAnswer: 3,
      ),
      Question(
        Title: "معروف ترین فضانورد دنیا کیست؟",
        ImageNumber: "images/2.png",
        answerList: [
          "ممد",
          "عباس",
          "امیر",
          "علی",
        ],
        correctAnswer: 3,
      ),
      Question(
        Title: "معروف ترین انالیزگر دنیا کیست؟",
        ImageNumber: "images/3.png",
        answerList: [
          "ممد",
          "عباس",
          "امیر",
          "علی",
        ],
        correctAnswer: 2,
      ),
    ];
