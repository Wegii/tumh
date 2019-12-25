import 'package:flutter/material.dart';

import 'package:tumh/data/data.dart';
import 'package:tumh/model/common/theme.dart';
import 'package:tumh/model/common/helper.dart';

class Page extends StatefulWidget {
  final int index;

  Page({@required this.index}) : super();

  @override
  _PageState createState() => _PageState(index);
}

class _PageState extends State<Page> {
  static List<bool> _isChecked = List<bool>();
  int _index;
  int _numberOfDays = 5;

  _PageState(this._index);

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
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 16.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        courses[_index].name,
                        style: header,
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                Row(
                  children: <Widget>[createCalendarRow()],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Available information",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22))),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Row(children: <Widget>[createTiles(courses[_index])])
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Weekly tasks",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22))),
                ),
                Container(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      children: <Widget>[createTasks(courses[_index])],
                    ))
              ],
            ),
          )
        ],
      ),
    );
    return page;
  }

  Checkbox createCheckbox(int index) => new Checkbox(
        value: _isChecked[index],
        onChanged: (bool value) {
          setState(() {
            _isChecked[index] = value;
          });
        },
        checkColor: Colors.white,
        activeColor: Color(0xFF464178),
      );

  Row createTiles(Course course) {
    List<Widget> tiles = new List<Widget>();

    if (course.linkLecture != null) {
      tiles.add(createContainer(website(
        "Lecture",
        "",
        course.linkLecture,
        colours[0 % colours.length],
        Icons.work,
        null,
      )));
    }
    if (course.linkTutorial != null) {
      tiles.add(createContainer(website("Tutorial", "", course.linkTutorial,
          colours[1 % colours.length], Icons.web, null)));
    }

    if (course.linkStream != null) {
      tiles.add(createContainer(website("Stream", "", course.linkStream,
          colours[2 % colours.length], Icons.video_library, null)));
    }

    if (course.linkWebsite != null) {
      tiles.add(createContainer(website("Website", "", course.linkWebsite,
          colours[3 % colours.length], Icons.home, null)));
    }

    return new Row(
      children: tiles,
    );
  }

  Container createContainer(Widget child) {
    return Container(
      height: 190,
      width: 160,
      child: child,
    );
  }

  Column createTasks(Course course) {
    List<Widget> tasks = new List<Widget>();

    int counter = 0;
    for (Task t in course.tasks) {
      _isChecked.add(t.isSet);
      tasks.add(task(t.name, createCheckbox(counter)));
      counter++;
    }

    return Column(children: tasks);
  }

  Flexible createCalendarRow() {
    List<Widget> days = new List<Widget>();

    // RoundedImageBorder() otherwise
    // RecImageBorder() for today
    int weekdayNow = new DateTime.now().weekday - 1;

    for (int i = 0; i < _numberOfDays; i++) {
      if (i != weekdayNow) {
        switch (i) {
          case 0:
            days.add(day("Mon", RoundedImageBorder()));
            break;
          case 1:
            days.add(day("Tue", RoundedImageBorder()));
            break;
          case 2:
            days.add(day("Wed", RoundedImageBorder()));
            break;
          case 3:
            days.add(day("Thu", RoundedImageBorder()));
            break;
          case 4:
            days.add(day("Fri", RoundedImageBorder()));
            break;
        }
      } else {
        days.add(day(week[i], RecImageBorder()));
      }
    }
    return calendarRow(calendarRow1(days));
  }

  Row calendarRow1(List<Widget> days) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: days
    );
}
