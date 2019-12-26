import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tumh/data/data.dart';
import 'package:vector_math/vector_math_64.dart' as math;

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:device_apps/device_apps.dart';


import 'package:tumh/model/page.dart';
import 'package:tumh/model/common/browser.dart';
import 'package:tumh/theme.dart';

/// Create a colored and filled circle.
class RoundedCircle extends CustomPainter {
  /// [color] defines the fill color of the circle.
  final Color color;

  RoundedCircle({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
        math.radians(-90),
        math.radians(360),
        false,
        borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// Create a colored and filled rectangle with rounded edges.
class RoundedRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
      new RRect.fromLTRBAndCorners(0.0, 0.0, 50, 50,
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15)),
      new Paint()..color = currentDayColorRow,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// Create a tile that spans the width of the screen
///
/// [day] specifies the day of the month.
/// [month] specifies the name of the month.
/// [title] specifies the smaller title of the tile.
/// [content] specifies the subtitle of the tile.
/// [onTouch] specifies the operation to perform when the tile is clicked.
///
/// Returns a container containing the tile.
Widget coloredTileFullWidth(int day, String month, String title, String content,
    Function onTouch) =>
    Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: primaryColorBackground),
          borderRadius: const BorderRadius.all(const Radius.circular(8)),
        ),
        margin: const EdgeInsets.all(4),
        child: GestureDetector(
          onTap: () => {onTouch()},
          child: Material(
            elevation: 0,
            color: Color(0xff18181B),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(10)),
                    color: fullColorTile),
                child: Padding(
                    padding:
                    const EdgeInsets.only(left: 30.0, top: 20, right: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    day.toString(),
                                    style: largeLetter,
                                  ),
                                ],
                              ),
                              Text(
                                month,
                                style: smallLetter,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                title,
                                style: mediumBoldLetter,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                content,
                                style: mediumLetter,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 40,
                                ),
                                circledIcon(Icons.keyboard_arrow_right,
                                    primaryColorBackground, 50, 30)
                              ],
                            ))
                      ],
                    ))),
          ),
        ));

/// Create a tile that spans half the width of the display if placed together
/// with another such tile.
///
/// [index] defines the index of the course from where to take the information
/// from.
/// [color] specifies the background color of the tile.
/// [context] used to open another page, when the tile is touched.
///
/// Returns a expanded widget with the tile inside.
Widget coloredTileHalfWidth(int index, Color color, BuildContext context) =>
    Expanded(
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 10, color: primaryColorBackground),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          margin: const EdgeInsets.all(4),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Page(
                          index: index,
                        )),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: color,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      courses[index].name,
                      style: mediumLetter,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      getDeadline(courses[index].dayHomework),
                      style: extraLargeLetter,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Days until deadline",
                      style: smallSubLetter,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );

/// Create a icon placed in a filled circle.
///
/// [icon] specifies which icon to place inside the circle.
/// [color] specifies the fill color of the circle.
/// [sizeCircle] specifies the width and height of the circle
/// [sizeIcon] specifies the size of the icon.
///
/// Returns a icon in a circle.
ClipOval circledIcon(IconData icon, Color color, double sizeCircle,
    double sizeIcon) =>
    ClipOval(
        child: Container(
            color: color,
            height: sizeCircle,
            width: sizeCircle,
            child: Icon(
              icon,
              color: defaultColorIcon,
              size: sizeIcon,
            )));

/// Create a row containing different days
///
/// [row] specifies the different day widgets placed inside the row. These days
/// are placed inside a rectangle with rounded edges.
///
/// Returns a flexible containing a row of days.
Widget calendarRow(Row row) =>
    Flexible(
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 10, color: primaryColorBackground),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),
            ),
            margin: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () => {},
              child: Material(
                elevation: 4,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        const Radius.circular(8)),
                    color: fullColorTile,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 10), child: row),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            )));

/// Create a day widget.
///
/// Creates a colored and filled [shape] containing the name of a day.
/// [name] specifies the name to display inside the [shape].
/// [shape] specifies the shape.
///
/// Return a container holding a [shape].
Widget day(String name, CustomPainter shape) =>
    Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: CustomPaint(
            painter: shape,
            child: Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              child: Text(
                name,
                style: dayLetter,
              ),
            ),
          ),
        ));

/// Create a task.
///
/// Creates one task. This task is comprised of a checkbox and the actual task
/// itself.
/// [name] specifies the name of the task.
/// [checkbox] specifies the checkbox to use.
///
/// Returns one task.
Widget task(String name, Center checkbox) =>
    Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: primaryColorBackground),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
      ),
      margin: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: fullColorTile,
        ),
        child: Row(
          children: <Widget>[
            checkbox,
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: taskLetter,
            ),
          ],
        ),
      ),
    );

/// Create a tile that opens [link] when clicked.
///
/// This tile opens [link] using the native browser.
/// [name] specifies the name of the tile.
/// [subtitle] specifies a subtitle place under [name].
/// [link] specifies the link to open.
/// [color] specifies the background color of the tile.
/// [icon] specifies the icon to use.
/// [percentage] unused.
///
/// Returns a tile that's able to open a specified website.
Widget website(String name, String subtitle, String link, Color color,
    IconData icon, int percentage) =>
    Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: primaryColorBackground),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
      ),
      margin: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () => {openBrowser(link)},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: color,
            boxShadow: [
              new BoxShadow(
                color: Colors.black45,
                blurRadius: 13,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: circledIcon(icon, shadowColor, 45, 30))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  name,
                  style: informationLetter,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  subtitle,
                  style: subInformationLetter,
                ),
              ],
            ),
          ),
        ),
      ),
    );

/// Get the days until a specified deadline
///
/// [deadline] specifies a day in the week as number, e.g. 0 stands for Monday,
/// etc.
///
/// Returns days until deadline.
String getDeadline(int deadline) {
  DateTime now = DateTime.now();

  if (deadline != null) {
    if (now.weekday > deadline) {
      return (deadline + (7 - now.weekday)).toString();
    } else {
      return (deadline - now.weekday).toString();
    }
  }

  return "/";
}

/// Open a link using the native browser.
///
/// [link] specifies the link to open.
void openBrowser(String link) async {
  await browser.open(
      url: link,
      options: ChromeSafariBrowserClassOptions(
          androidChromeCustomTabsOptions:
          AndroidChromeCustomTabsOptions(addShareButton: false),
          iosSafariOptions: IosSafariOptions(barCollapsingEnabled: true)));
}

/// Open the Google Calendar app if installed.
///
/// Attention: If Google Calendar is not installed, no exceptions will be
/// thrown. In that case, nothing will happen.
Future<void> openCalendar() async {
  if (Platform.isAndroid) {
    bool isInstalled = await DeviceApps.isAppInstalled(
        'com.google.android.calendar');
    if (isInstalled != false)
      DeviceApps.openApp('com.google.android.calendar');
    else
      print("Cannot open app");
  }
}