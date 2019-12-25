import 'package:flutter/material.dart';
import 'package:tumh/data/data.dart';
import 'package:vector_math/vector_math_64.dart' as math;

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:tumh/model/page.dart';
import 'package:tumh/model/common/browser.dart';
import 'package:tumh/data/calendar.dart';

class RoundedImageBorder extends CustomPainter {
  final Color color;

  RoundedImageBorder({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint borderPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0
      ..color = color;

    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(360), false, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RecImageBorder extends CustomPainter {
  final bool isOnline;

  RecImageBorder({this.isOnline});

  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0
      ..color = Color(0xFF464178);

    canvas.drawRRect(
      new RRect.fromLTRBAndCorners(0.0, 0.0, 50, 50,
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15)),
      new Paint()..color = new Color(0xFF464178),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Widget coloredTileFullWidth(int day, String month, String title, String content,
        Function function) =>
    Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Color(0xFF1A1E21)),
          borderRadius: const BorderRadius.all(const Radius.circular(8)),
        ),
        margin: const EdgeInsets.all(4),
        child: GestureDetector(
          onTap: () => {function()},
          child: Material(
            elevation: 0,
            color: Color(0xff18181B),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10)),
                    color: Color(0xFF272E32)),
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
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                month,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                content,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
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
                                    Color(0xFF1A1E21), 50, 30)
                              ],
                            ))
                      ],
                    ))),
          ),
        ));

ClipOval circledIcon(
        IconData icon, Color color, double sizeCircle, double sizeIcon) =>
    ClipOval(
        child: Container(
            color: color,
            height: sizeCircle,
            width: sizeCircle,
            child: Icon(
              icon,
              color: Colors.white,
              size: sizeIcon,
            )));

Widget coloredTileHalfWidth(int index, Color color, BuildContext context) =>
    Expanded(
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 10, color: Color(0xFF1A1E21)),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          margin: const EdgeInsets.all(4),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Page(
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
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "asd",//getDeadline(courses[index].dayHomework),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Days until deadline",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );

String getDeadline(int deadline) {
  DateTime now = DateTime.now();
  print(deadline.toString() + " deadline");

  if (deadline != null) {
    if (now.weekday > deadline) {
      return (deadline + (7 - now.weekday)).toString();
    } else {
      return (deadline - now.weekday).toString();
    }
  }

  return "/";
}

Widget calendarRow(Row row) => Flexible(
    child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Color(0xFF1A1E21)),
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
                borderRadius: const BorderRadius.all(const Radius.circular(8)),
                color: Color(0xFF272E32),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(top: 10), child: row),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        )));

Widget day(String name, CustomPainter shape) => Container(
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    ));

Widget task(String name, Center checkbox) => Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Color(0xFF1A1E21)),
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
      ),
      margin: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: Color(0xFF272E32),
        ),
        child: Row(
          children: <Widget>[
            checkbox,
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );

Widget website(String name, String subtitle, String link, Color color,
        IconData icon, int percentage) =>
    Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Color(0xFF1A1E21)),
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
                        child: circledIcon(icon, Color(0x66584b4b), 45, 30))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );

openBrowser(String link) async {
  await browser.open(
      url: link,
      options: ChromeSafariBrowserClassOptions(
          androidChromeCustomTabsOptions:
              AndroidChromeCustomTabsOptions(addShareButton: false),
          iosSafariOptions: IosSafariOptions(barCollapsingEnabled: true)));
}
