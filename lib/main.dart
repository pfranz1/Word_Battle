import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:word_battle/widgets/champ_indicator.dart';

import './widgets/word_card.dart';
import 'models/sideEnum.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Battle',
      theme: ThemeData.dark(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String leftWord = "Left Card";
  String rightWord = "Right Card";

  Side champSide = Side.left;

  void cardSelected(Side sideEnum) {
    switch (sideEnum) {
      case Side.right:
        setState(() {
          leftWord = (generateWordPairs().take(1).firstWhere((_) => true))
              .asPascalCase;
          champSide = Side.right;
        });
        break;
      case Side.left:
        setState(() {
          rightWord = (generateWordPairs().take(1).firstWhere((_) => true))
              .asPascalCase;
          champSide = Side.left;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Word Battle',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChampIndicator(champSide),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WordCard(leftWord, Side.left, cardSelected),
                WordCard(rightWord, Side.right, cardSelected),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
