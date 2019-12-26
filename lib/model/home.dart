import 'package:flutter/material.dart';
import 'package:tumh/data/calendar.dart';

import 'package:tumh/theme.dart';
import 'package:tumh/data/data.dart';
import 'package:tumh/model/common/helper.dart';

/// Defines the homepage.
///
/// This class defines the homepage of the app and contains a small calendar
/// widget at the top followed by tiles for different courses.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/// Homepage state.
class _HomePageState extends State<HomePage> {
  /// [calendar] defines the object which allows communication with the
  /// google calendar app. No exceptions will be thrown if such doesn't exist.
  /// In that case, nothings will happen.
  final CalendarInteraction calendar = new CalendarInteraction();

  /// Defines the number of calendar day which will be shown at the top of
  /// the screen.
  final int numEvents = 10;

  /// Dummy row that will later be filled with different events from the
  /// calendar. This is necessary as events are only received asynchronously
  /// by the [CalendarInteraction] object.
  Row calendarEvents = new Row();

  /// Initialize state and start filling the calendar widget with events.
  _HomePageState() {
    constructEvents().then((val) => setState(() {
          calendarEvents = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    // Whole scaffold containing calendar (including events) and course tiles.
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
                        Text("Good day,\n$username", style: welcomeLetter)
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

  /// Constructs tiles and returns them in a column.
  ///
  /// Returns a Column containing rows. Each row containing two tiles, where
  /// each represents its own course.
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

    // In case a odd number of courses is defined, add a single one at the
    // bottom, which spans the whole width.
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

  /// Creates the events for the calendar.
  ///
  /// These events will be shown as tiles at the top of the screen. Each tile
  /// represents one specific day, thus only one calendar event is displayed.
  ///
  /// The events are received by calling the class-object [calendar].
  ///
  /// Returns a row containing all tiles.
  Future<Row> constructEvents() async {
    List<Widget> events = new List<Widget>();
    DateTime now = DateTime.now();

    for (int i = 0; i < numEvents; i++) {
      // Create a list of all events starting from now.
      List<EventDisplay> eventList = await calendar.getEvents(i);

      // If no events are returned, let the tile be empty.
      if (eventList.length != 0) {
        EventDisplay event = eventList.first;

        events.add(Container(
          height: 200,
          width: 360,
          child: coloredTileFullWidth(
              now.day,
              getMonthName(now.month),
              event.title,
              ((event.content.length <= 60)
                      ? event.content
                      : event.content.substring(0, 60)[0]) +
                  " " +
                  event.start,
              () => {openCalendar()}),
        ));
      } else {
        events.add(Container(
          height: 200,
          width: 360,
          child: coloredTileFullWidth(
              now.day, getMonthName(now.month), "", "", () => {}),
        ));
      }
      now = now.add(new Duration(days: 1));
    }

    return Row(children: events);
  }

  /// Returns string representation of month.
  ///
  /// Attention: Numbering starts from 1!
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
