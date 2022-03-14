import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'vazir'),
      home: Scaffold(
        appBar: _getAppBar(),
        body: _getMainBody(),
      ),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Center(
        child: Center(
          child: Text("علیرضا باشی"),
        ),
      ),
    );
  }

  Widget _getMainBody() {
    return SingleChildScrollView(child: _getHeader());
  }

  Widget _getHeader() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
          ),
          SizedBox(height: 20),
          CircleAvatar(
              backgroundImage: AssetImage('images/my.jpg'), radius: 70),
          SizedBox(
            height: 15,
          ),
          Text('علیرضا باشیم یه برنامه نویس و معلم',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800)),
          SizedBox(
            height: 15,
          ),
          Text(
            'عاشق برنامه نویسی اندروید و جدیدا فلاتر و دوست دارم هرچیزی که یاد میگیریم یاد بدم',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          _getMySocialNetwork(),
          SizedBox(
            height: 10,
          ),
          _getSkillCards(),
          SizedBox(
            height: 10,
          ),
          _getResume()
        ],
      ),
    );
  }

  Widget _getMySocialNetwork() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.linkedin),
          color: Colors.blue,
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.github),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.telegram),
          color: Colors.blue,
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.instagram),
          color: Colors.red,
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.twitter),
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _getSkillCards() {
    var Names = ['android', 'kotlin', 'java', 'dart', 'flutter'];

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      children: [
        for (var name in Names)
          Card(
            elevation: 6,
            child: Column(
              children: [
                Container(
                  width: 45.0,
                  height: 45.0,
                  child: Image(
                    image: AssetImage('images/$name.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(name),
                ),
              ],
            ),
          )
      ],
    );
  }

  Widget _getResume() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      color: Colors.grey[200],
      child: Column(
        children: [
          Text(
            'کارای من',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          _getHistoryColumn()
        ],
      ),
    );
  }

  Widget _getHistoryColumn() {
    var listResume = {
      'برنامه نویس اندروید دور نما از 1401',
      'کانال اموزشی یوتیوب از 2022',
      'مدرس و بنیان گذار سایت yarDeveloper'
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: double.infinity,
          height: 20,
        ),
        for (var text in listResume)
          Text(
            text,
            textDirection: TextDirection.rtl,
          )
      ],
    );
  }
}
