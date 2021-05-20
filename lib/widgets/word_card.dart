import 'package:flutter/material.dart';
import '../models/sideEnum.dart';

class WordCard extends StatelessWidget {
  final String _title;
  final Side _side;
  final Function _tapHandler;

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
            elevation: 0,
            child: Center(
              child: FittedBox(
                child: Text(
                  _title,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
