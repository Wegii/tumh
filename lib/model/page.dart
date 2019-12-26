import 'package:flutter/material.dart';

import 'package:tumh/data/data.dart';
import 'package:tumh/theme.dart';
import 'package:tumh/model/common/helper.dart';

/// Defines a customizable page for a course.
///
/// This page is customized on runtime and will be filled with different
/// data specified in a specific file.
class Page extends StatefulWidget {
  /// [index] defines which course to display.
  final int index;

  Page({@required this.index}) : super();

  @override
  _PageState createState() => _PageState(index);
}

/// Page state
class _PageState extends State<Page> {
  /// List representing the states of the checkboxes used for ticking off
  /// tasks.
  static List<bool> _isChecked = List<bool>();

  /// Defines which course to display.
  int _index;

  /// Specifies number of days to shown on top of the screen.
  int _numberOfDays = 5;

  _PageState(this._index);

  @override
  Widget build(BuildContext context) {
    // Whole scaffold containing a small calendar row, links to specific
    // websites, and a list of tasks.
    Scaffold page = Scaffold(
      backgroundColor: primaryColorBackground,
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
                        style: welcomeLetter,
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                Row(
                  children: <Widget>[createCalendarRow(courses[_index])],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Available information",
                          style: smallHeaderStyle)),
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
                      child: Text("Weekly tasks", style: smallHeaderStyle)),
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

  /// Create a row containing [_numberOfDays] many days.
  ///
  /// Each day is either represented by a circle (normal day) or rounded
  /// rectangle (current day). Furthermore, different coloring sheds awareness
  /// on a daily event, e.g. blue coloring defines lecture days.
  ///
  /// Returns a flexible containing the row of days.
  Flexible createCalendarRow(Course course) {
    List<Widget> days = new List<Widget>();
    int weekdayNow = new DateTime.now().weekday - 1;

    for (int i = 0; i < _numberOfDays; i++) {
      Color color = primaryColorRow;

      // Special coloring for specific days
      if (course.daysLecture.contains(Day.values[i])) {
        color = lectureColorRow;
      } else if (course.dayTutorial == Day.values[i]) {
        color = tutorialColorRow;
      } else if (course.dayHomework == i) {
        color = homeworkColorRow;
      }

      if (i != weekdayNow) {
        switch (i) {
          case 0:
            days.add(day(week[i], RoundedCircle(color: color)));
            break;
          case 1:
            days.add(day(week[i], RoundedCircle(color: color)));
            break;
          case 2:
            days.add(day(week[i], RoundedCircle(color: color)));
            break;
          case 3:
            days.add(day(week[i], RoundedCircle(color: color)));
            break;
          case 4:
            days.add(day(week[i], RoundedCircle(color: color)));
            break;
        }
      } else {
        days.add(day(week[i], RoundedRectangle()));
      }
    }
    return calendarRow(calendarRow1(days));
  }

  /// Create centered row containing a number of days.
  Row calendarRow1(List<Widget> days) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: days);


  /// Create a number of tiles which open perform a specific operation when
  /// pressed.
  ///
  /// [course] defines the course object which holds all the data for this
  /// page.
  /// Each tile performs a specific operation, e.g. open a website using the
  /// native browser.
  ///
  /// Returns a row of tiles.
  Row createTiles(Course course) {
    List<Widget> tiles = new List<Widget>();

    if (course.linkLecture != null) {
      tiles.add(createContainer(website(
        "Lecture",
        "Moodle website",
        course.linkLecture,
        colours[0],
        Icons.work,
        null,
      )));
    }
    if (course.linkTutorial != null) {
      tiles.add(createContainer(website("Tutorial", "Custom website",
          course.linkTutorial, colours[1 % colours.length], Icons.web, null)));
    }

    if (course.linkStream != null) {
      tiles.add(createContainer(website("Stream", "RBG website", course.linkStream,
          colours[2 % colours.length], Icons.video_library, null)));
    }

    if (course.linkWebsite != null) {
      tiles.add(createContainer(website("Website", "Custom website", course.linkWebsite,
          colours[3 % colours.length], Icons.home, null)));
    }

    return new Row(
      children: tiles,
    );
  }

  /// Returns a container with a predefined size, with [child] as child.
  Container createContainer(Widget child) {
    return Container(
      height: 190,
      width: 160,
      child: child,
    );
  }

  /// Create tasks.
  ///
  /// [course] specifies from which course object to take the tasks from. For
  /// each specified task, a row will be created in which a checkbox is placed,
  /// as well as its name (i.e. the actual task).
  ///
  /// Return a column containing all the created tasks, specified in [course]
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

  /// Create a custom checkbox.
  ///
  /// [index] defines the position in [_isChecked] which stores the state of the
  /// checkbox.
  ///
  /// Returns a widget with the custom checkbox.
  Widget createCheckbox(int index) => Center(
      child: InkWell(
          onTap: () {
            setState(() {
              _isChecked[index] = !_isChecked[index];
            });
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _isChecked[index]
                  ? Icon(
                Icons.check_box,
                size: 25.0,
                color: primaryColorCheckbox,
              )
                  : Icon(
                Icons.check_box_outline_blank,
                size: 25.0,
                color: primaryColorCheckbox,
              ),
            ),
          )));
}
