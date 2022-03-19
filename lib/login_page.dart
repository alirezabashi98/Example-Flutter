import 'package:flutter/material.dart';
import 'package:flutter_application_2/blog_page.dart';
import 'package:flutter_application_2/go_to_page.dart';
import 'package:flutter_application_2/password_recovery_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
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
                    SizedBox(
                      width: 14,
                    ),
                    Icon(
                      Icons.login,
                      color: Colors.white,
                    )
                  ],
                ),
                Image(
                  image: AssetImage('images/splash_screen.png'),
                ),
                OutlinedButton(
                  onPressed: () {
                    goToPage(context, BlogPage());
                  },
                  child: Text(
                    'ورود به حساب',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size(200.0, 40.0),
                      side: BorderSide(color: Colors.white, width: 2.0),
                      primary: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'ثبت نام',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200.0, 40.0), primary: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    goToPage(context, PasswordRecoveryPage());
                  },
                  child: Text(
                    'رمز عبور فراموش کردم',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: TextButton.styleFrom(
                      minimumSize: Size(200.0, 40.0), primary: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
