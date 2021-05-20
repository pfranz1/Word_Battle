import 'package:flutter/material.dart';
import 'package:word_battle/models/tombstone.dart';

import 'package:ordered_set/ordered_set.dart';

Color findColorForIndex(index, context) {
  switch (index) {
    case 0:
      return Colors.yellow[400];
    case 1:
      return Colors.grey[400];
    case 2:
      return Colors.brown[500];
    default:
      return Theme.of(context).dividerColor;
  }
}

class Graveyard extends StatefulWidget {
  final OrderedSet<Tombstone> _deathRecords;

  Graveyard(this._deathRecords);

  @override
  _GraveyardState createState() => _GraveyardState();
}

class _GraveyardState extends State<Graveyard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Graveyard'),
      ),
      body: Column(
        children: [
          // Card(
          //   elevation: 10,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         'Name',
          //         style: Theme.of(context).textTheme.headline6,
          //       ),
          //       Text(
          //         'Streak',
          //         style: Theme.of(context).textTheme.headline6,
          //       ),
          //       Text(
          //         'Vanquisher',
          //         style: Theme.of(context).textTheme.headline6,
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            height: 600,
            child: ListView.builder(
                itemCount: widget._deathRecords.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: findColorForIndex(index, context),
                              width: 4.0,
                            ),
                          ),
                          child: Text(
                            '${widget._deathRecords.elementAt(index).streak}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget._deathRecords.elementAt(index).name}',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              'Slain by ${widget._deathRecords.elementAt(index).causeOfDeath}',
                              style: Theme.of(context).textTheme.subtitle2,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
