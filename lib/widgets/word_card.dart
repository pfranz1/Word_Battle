import 'package:flutter/material.dart';
import 'dart:math';

import '../models/sideEnum.dart';

class WordCard extends StatelessWidget {
  final String _title;
  final Side _side;
  final Function _tapHandler;

  static const List AVAILABLE_FONTS = []


  String getRadomFont() {
    Random rng = new Random();
    return AVAILABLE_FONTS[rng.nextInt(AVAILABLE_FONTS.length)];
  }

  WordCard(this._title, this._side, this._tapHandler);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => _tapHandler(_side),
        radius: 10,
        child: SizedBox(
          height: 120,
          width: 180,
          child: Card(
            elevation: 5,
            child: Center(
              child: FittedBox(
                child: Text(
                  _title,
                  style: TextStyle(
                    fontFamily: getRandomFont(),
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//Theme.of(context).textTheme.headline4
