import 'package:flutter/material.dart';
import 'package:tumh/data/calendar.dart';

import 'package:tumh/theme.dart';
import 'package:tumh/data/data.dart';
import 'package:tumh/model/common/helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CalendarInteraction calendar = new CalendarInteraction();
  final int numEvents = 10;
  Row calendarEvents = new Row();

  _HomePageState() {
    constructEvents().then((val) => setState(() {
          calendarEvents = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    Scaffold page = Scaffold(
      backgroundColor: primaryColorBackground,
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
                        Text("Good day,\n$username", style: header)
                      ])
                    ],
                  ),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: calendarEvents),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child: Column(
                      children: <Widget>[constructTiles()],
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

  Column constructTiles() {
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
    return new Column(
      children: tiles,
    );
  }

  Future<Row> constructEvents() async {
    List<Widget> events = new List<Widget>();
    DateTime now = DateTime.now();

    for (int i = 0; i < numEvents; i++) {
      List<EventDisplay> eventList = await calendar.getEvents(i);

      if (eventList.length != 0) {
        EventDisplay event = eventList.first;

        events.add(Container(
          height: 200,
          width: 360,
          child: coloredTileFullWidth(now.day, getMonthName(now.month),
              event.title, ((event.content.length <= 60)
                  ? event.content
                  : event.content.substring(0, 60)[0]) + " " + event.start, ()=>{openCalendar()}),
        ));
      } else {
        events.add(Container(
          height: 200,
          width: 360,
          child: coloredTileFullWidth(now.day, getMonthName(now.month),
              "", "", () => {}),
        ));
      }
      now = now.add(new Duration(days: 1));
    }

    return Row(children: events);
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
    }
    return "";
  }
}
