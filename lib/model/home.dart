import 'package:flutter/material.dart';

import 'package:tumh/model/page.dart';
import 'package:tumh/model/common/theme.dart';
import 'package:tumh/data/data.dart';
import 'package:tumh/model/common/helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Scaffold page = Scaffold(
      backgroundColor: Color(0xFF1A1E21),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 16.0),
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text("Good day,\nPeter", style: header)
                      ])
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                        Container(
                            height: 200,
                            width: 360,
                            child: coloredTileFullWidth()),
                      Container(
                          height: 200,
                          width: 360,
                          child: coloredTileFullWidth())
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child: Column(
                      children: <Widget>[constructRows()],
                    )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
    return page;
  }

  Column constructRows() {
    int counter = 0;
    final int length = courses.length;
    List<Widget> tiles = new List<Widget>();

    for (int i = 0; i < length ~/ 2; i++) {
      tiles.add(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          coloredTileHalfWidth(
              counter, colours[(counter) % colours.length], context),
          coloredTileHalfWidth(
              counter + 1, colours[(counter + 1) % colours.length], context)
        ],
      ));
      counter += 2;
    }
    if (length % 2 != 0) {
      tiles.add(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          coloredTileHalfWidth(
              length - 1, colours[(length - 1) % colours.length], context)
        ],
      ));
    }
    return new Column(children: tiles,);
  }
}
