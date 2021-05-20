import 'package:flutter/material.dart';

import '../models/sideEnum.dart';

class ChampIndicator extends StatelessWidget {
  final Side champSide;

  ChampIndicator(this.champSide);

  @override
  Widget build(BuildContext context) {
    SizedBox(
      width: 325,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          champSide != Side.left
              ? SizedBox(
                  width: 225,
                )
              : SizedBox(
                  width: 0,
                ),
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
//champSide == Side.left
// ? MainAxisAlignment.start
// : MainAxisAlignment.end,
