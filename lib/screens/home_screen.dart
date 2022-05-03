import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  bool isTrunO = true;
  List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];
  int FilledBoxes = 0;
  int PlayerX = 0;
  int PlayerO = 0;

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
        actions: [
          IconButton(
              onPressed: () {
                _clearGame();
              },
              icon: Icon(Icons.refresh))
        ],
      );

  _Scoreboard() => Row(
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
                    '$PlayerO',
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
                    '$PlayerX',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  _GridGamePaly() => Expanded(
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
        FilledBoxes++;
        xOrOList[index] = isTrunO ? 'O' : 'X';
        isTrunO = !isTrunO;
        _checkWinner();
      });
  }

  _checkWinner() {
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      _winner(xOrOList[0]);
    } else if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      _winner(xOrOList[3]);
    } else if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      _winner(xOrOList[6]);
    } else if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      _winner(xOrOList[0]);
    } else if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      _winner(xOrOList[1]);
    } else if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      _winner(xOrOList[2]);
    } else if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      _winner(xOrOList[0]);
    } else if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      _winner(xOrOList[2]);
    } else if (FilledBoxes == xOrOList.length) {
      _refresh();
      print('مساوی');
    }
  }

  _winner(String player) => setState(() {
        player == 'O' ? PlayerO++ : PlayerX++;
        _refresh();
      });

  _refresh() => setState(() {
        xOrOList = ['', '', '', '', '', '', '', '', ''];
        FilledBoxes = 0;
      });

  _clearGame() => setState(() {
        xOrOList = ['', '', '', '', '', '', '', '', ''];
        FilledBoxes = 0;
        PlayerO = 0;
        PlayerX = 0;
      });

  _getTrun() => Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          isTrunO ? 'Trun O' : 'Trun X',
          style: TextStyle(
              color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
}
