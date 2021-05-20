import 'package:flutter/material.dart';

import '../models/sideEnum.dart';

class ChampIndicator extends StatelessWidget {
  final Side champSide;

  ChampIndicator(this.champSide);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Row(
        mainAxisAlignment: champSide == Side.left
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Icon(Icons.ac_unit),
        ],
      ),
    );
  }
}
