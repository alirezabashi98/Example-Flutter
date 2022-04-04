import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/background_shape_left.dart';
import 'package:flutter_application_2/widgets/background_shape_right.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'vazir'),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            RightShape(width: 150),
            RightShape(width: 210),
            RightShape(width: 180),
            LeftShape(width: 150),
            LeftShape(width: 210),
            LeftShape(width: 180),
          ],
        )
      ),
    );
  }
}
