import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  bool isTrunO = true;
  List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];
  int valueList = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: _AppBarHomeScreen(),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                _Scoreboard(),
                SizedBox(
                  height: 20,
                ),
                _GridGamePaly(),
                _getTrun(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _AppBarHomeScreen() => AppBar(
        title: Text("Tic Tac Toe"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[900],
      );

  _Scoreboard() => Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Player O',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Player X',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  _GridGamePaly() => Expanded(
        flex: 7,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: GridView.builder(
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () => _tapperd(index),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber),
                ),
                child: Center(
                  child: Text(
                    xOrOList[index],
                    style: TextStyle(
                      color: (xOrOList[index] == 'O')
                          ? Colors.blue[500]
                          : Colors.red[500],
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  _tapperd(int index) {
    
    if (xOrOList[index] == '')
      setState(() {
        valueList++;
        xOrOList[index] = isTrunO ? 'O' : 'X';
        isTrunO = !isTrunO;
      });

    if (valueList == xOrOList.length)
      setState(() {
        xOrOList = ['', '', '', '', '', '', '', '', ''];
        valueList = 0;
      });
  }

  _getTrun() => Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            isTrunO ? 'Trun O' : 'Trun X',
            style: TextStyle(
                color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
}
