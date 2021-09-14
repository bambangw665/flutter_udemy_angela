import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text("Dicee"),
          ),
          body: DicePage(),
        ));
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftChangeDice = 1;
  int rightChangeDice = 1;

  void ChangeDice(){
    setState(() {
      leftChangeDice = Random().nextInt(6) + 1;
      rightChangeDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                onPressed: () {
                  ChangeDice();
                },
                child: Image.asset("images/dice$leftChangeDice.png"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: FlatButton(
                onPressed: (){
                  ChangeDice();
                },
                child: Image.asset("images/dice$rightChangeDice.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
