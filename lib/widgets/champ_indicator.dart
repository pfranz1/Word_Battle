import 'package:flutter/material.dart';

import '../models/sideEnum.dart';

class ChampIndicator extends StatelessWidget {
  final Side champSide;

  ChampIndicator(this.champSide);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325,
      child: Row(
        mainAxisAlignment: champSide == Side.left
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Container(
            height: 100,
            child: Image.asset(
              './assets/images/crown.png',
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
