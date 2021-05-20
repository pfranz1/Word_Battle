import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:ordered_set/ordered_set.dart';

import './widgets/champ_indicator.dart';
import './widgets/graveyard.dart';
import './widgets/word_card.dart';

import 'models/sideEnum.dart';
import 'models/tombstone.dart';

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
  String leftWord =
      (generateWordPairs().take(1).firstWhere((_) => true)).asPascalCase;
  String rightWord =
      (generateWordPairs().take(1).firstWhere((_) => true)).asPascalCase;

  Side champSide = Side.left;
  int champStreak = 0;

  OrderedSet<Tombstone> graveyard =
      OrderedSet<Tombstone>((a, b) => b.streak - a.streak);

  void cardSelected(Side sideEnum) {
    switch (sideEnum) {
      case Side.right:
        setState(() {
          if (champSide != Side.right) {
            //Champ loss
            champSide = Side.right;
            //print('final champ streak for $leftWord was $champStreak');
            graveyard.add(Tombstone(leftWord, champStreak, rightWord));
            champStreak = 1;
          } else {
            //Champ win
            champStreak++;
          }
          leftWord = (generateWordPairs().take(1).firstWhere((_) => true))
              .asPascalCase;
        });
        break;
      case Side.left:
        setState(() {
          if (champSide != Side.left) {
            //Champ loss
            champSide = Side.left;
            //print('final champ streak for $rightWord was $champStreak');
            graveyard.add(Tombstone(rightWord, champStreak, leftWord));
            champStreak = 1;
          } else {
            //Champ win
            champStreak++;
          }

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
        centerTitle: true,
        title: Text(
          'Word Battle',
          textAlign: TextAlign.left,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  String champName =
                      champSide == Side.left ? leftWord : rightWord;

                  graveyard.removeWhere((element) {
                    return (element.causeOfDeath == '-');
                  });
                  graveyard.add(Tombstone(champName, champStreak, "-"));
                  //print(graveyard.toString());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Graveyard(graveyard)));
                },
                child: Image.asset('./assets/images/trophy_white.png'),
              )),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
            ),
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
