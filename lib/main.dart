import 'package:flutter/material.dart';

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
        home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'خوش آمدید',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                      SizedBox(width: 14,),
                      Icon(Icons.login,color: Colors.white,)
                    ],
                  ),
                  Image(
                    image: AssetImage('images/splash_screen.png'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'ورود به حساب',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: OutlinedButton.styleFrom(
                        minimumSize: Size(200.0, 40.0),
                        side: BorderSide(color: Colors.white, width: 2.0),
                        primary: Colors.white),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        primary: Colors.black,
                        minimumSize: Size(200.0, 40.0)),
                    onPressed: () {},
                    child: Text(
                      'ثبت نام',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
