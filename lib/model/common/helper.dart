import 'package:flutter/material.dart';
import 'package:tumh/data/data.dart';
import 'package:vector_math/vector_math_64.dart' as math;

import 'package:tumh/model/page.dart';

class RoundedImageBorder extends CustomPainter {
  final bool isOnline;

  RoundedImageBorder({this.isOnline});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint borderPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0;

    borderPaint.color = Color(0xFF7B778E);
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
      ..strokeWidth = 4.0;

    borderPaint.color = Color(0xFF464178);
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

Widget coloredTileFullWidth() => Container(
    decoration: BoxDecoration(
      border: Border.all(width: 10, color: Color(0xFF1A1E21)),
      borderRadius: const BorderRadius.all(const Radius.circular(8)),
    ),
    margin: const EdgeInsets.all(4),
    child: GestureDetector(
      onTap: () => {print("pressed")},
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
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "31",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          "December",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "2020 Countdown",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Town square 22:00",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        ClipOval(
                            child: Container(
                                color: Color(0xFF1A1E21),
                                height: 50,
                                width: 50,
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                  size: 30,
                                )))
                      ],
                    )
                  ],
                ))),
      ),
    ));

Widget coloredTileHalfWidth(int index, Color color, BuildContext context) => Expanded(
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
                  index.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Week 14 - Not Done",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      )),
);
