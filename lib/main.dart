import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  Widget getRow(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.all(3),
          child: TextButton(
            style: TextButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(width: 10, color: Colors.transparent),
                ),
                backgroundColor: getBackgroundColor(text1)),
            onPressed: () {
              if (text1 == 'ac')
                setState(() {
                  buttonAc();
                });
              else
                buttonPressed(text1);
            },
            child: Text(
              text1,
              style: TextStyle(color: getTextColor(text1), fontSize: 26),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(3),
          child: TextButton(
            style: TextButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(width: 10, color: Colors.transparent),
                ),
                backgroundColor: getBackgroundColor(text2)),
            onPressed: () {
              if (text2 == 'ce')
                setState(() {
                  buttonCe();
                });
              else
                buttonPressed(text2);
            },
            child: Text(
              text2,
              style: TextStyle(color: getTextColor(text2), fontSize: 26),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(3),
          child: TextButton(
            style: TextButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(width: 10, color: Colors.transparent),
                ),
                backgroundColor: getBackgroundColor(text3)),
            onPressed: () {
              buttonPressed(text3);
            },
            child: Text(
              text3,
              style: TextStyle(color: getTextColor(text3), fontSize: 26),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(3),
          child: TextButton(
            style: TextButton.styleFrom(
                shape: CircleBorder(
                    side: BorderSide(width: 10, color: Colors.transparent)),
                backgroundColor: getBackgroundColor(text4)),
            onPressed: () {
              if (
              inputUser1.length > 0 &&
                  inputUser2.length > 0&&
                  inputOperator.length > 0 &&
                  (text4 == '/' ||
                      text4 == '*' ||
                      text4 == '-' ||
                      text4 == '+')
              )
                setState(() {
                  setAddValue(text4);
                });
              else if (
              inputUser1.length > 0 &&
                  inputUser2.length > 0&&
                  inputOperator.length > 0&&
                  result.length > 0 &&
                  (text4 == '/' ||
                      text4 == '*' ||
                      text4 == '-' ||
                      text4 == '+')
              )
                setState(() {
                  setNewValue(text4);
                });
              else if (text4 == '=')
                setState(() {
                  result = getResult().toString();
                });
              else
                buttonPressed(text4);
            },
            child: Text(
              text4,
              style: TextStyle(color: getTextColor(text4), fontSize: 26),
            ),
          ),
        ),
      ],
    );
  }

  bool isOperator(String text) {
    var items = ['ac', 'ce', '%', '/', '*', '-', '+', '='];
    for (var item in items)
      if (item == text) return true;
    return false;
  }

  Color getBackgroundColor(String text) {
    if (isOperator(text))
      return backgroundGreyDark;
    else
      return backgroundGrey;
  }

  Color getTextColor(String text) {
    if (isOperator(text))
      return textGreen;
    else
      return textGrey;
  }

  String inputUser1 = '';
  String inputUser2 = '';
  String result = '';
  String inputOperator = '';

  void setNewValue(String text){
    inputUser1 = result;
    inputUser2 = '';
    result = '';
    inputOperator = text;
  }

  void setAddValue(String text){
    inputUser1 = getResult().toString();
    inputUser2 = '';
    result = '';
    inputOperator = text;
  }

  void buttonPressed(String text) {
    setState(() {
      if (!isOperator(text) && inputOperator == '')
        inputUser1 += text;
      else if (inputUser2 == '' &&
          inputUser1 != '' &&
          isOperator(text) &&
          text != '=' &&
          text != 'ac' &&
          text != 'ce')
        inputOperator = text;
      else if (inputUser1 != '' && !isOperator(text) && inputOperator != '')
        inputUser2 += text;
    });
  }

  void buttonCe() {
    if (inputUser2 != '')
      inputUser2 = inputUser2.substring(0, inputUser2.length - 1);
    else if (inputUser2 == '' && inputOperator != '')
      inputOperator = '';
    else if (inputUser1 != '')
      inputUser1 = inputUser1.substring(0, inputUser1.length - 1);
  }

  void buttonAc() {
    inputUser1 = '';
    inputUser2 = '';
    result = '';
    inputOperator = '';
  }

  double getResult() {
    if (inputUser1.length > 0 &&
        inputUser2.length > 0 &&
        inputOperator.length > 0) {
      Parser parser = Parser();
      Expression expression =
      parser.parse(inputUser1 + inputOperator + inputUser2);
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);

      return eval;
    } else
      return 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: backgroundGreyDark,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          inputUser1 + inputOperator + inputUser2,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: textGreen),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          result,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 52,
                              fontWeight: FontWeight.bold,
                              color: textGrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: backgroundGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      getRow('ac', 'ce', '%', '/'),
                      getRow('7', '8', '9', '*'),
                      getRow('4', '5', '6', '-'),
                      getRow('1', '2', '3', '+'),
                      getRow('00', '0', '.', '='),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
