import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tumh/data/data.dart';

import 'package:tumh/model/common/browser.dart';
import 'package:tumh/model/common/theme.dart';
import 'package:tumh/model/common/helper.dart';

class Page extends StatefulWidget {
  final ChromeSafariBrowser browser = new ChromeBrowser(new Browser());
  final int index;

  Page({@required this.index}) : super();

  @override
  _PageState createState() => _PageState(index);
}

class _PageState extends State<Page> {
  static bool f1 = false;
  static bool f2 = false;
  static bool f3 = false;
  int index;

  _PageState(this.index);

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
                        courses[index].name,
                        style: header,
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                Row(
                  children: <Widget>[calendarRow()],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Your activities",
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
                      Container(height: 190, width: 160, child: moodle1()),
                      Container(height: 190, width: 160, child: moodle2()),
                      Container(height: 190, width: 160, child: website()),
                      Container(height: 190, width: 160, child: stream())
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Your tasks",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22))),
                ),
                Container(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      children: <Widget>[
                        task1(),
                        task2(),
                        task3()
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
    return page;
  }

  openMoodle() async {
    await widget.browser.open(
        url: "https://www.moodle.tum.de/",
        options: ChromeSafariBrowserClassOptions(
            androidChromeCustomTabsOptions:
                AndroidChromeCustomTabsOptions(addShareButton: false),
            iosSafariOptions: IosSafariOptions(barCollapsingEnabled: true)));
  }

  Widget calendarRow() => Flexible(
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 10, color: Color(0xFF1A1E21)),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          margin: const EdgeInsets.all(4),
          child: GestureDetector(
            onTap: () => {print("pressed")},
            child: Material(
              elevation: 4,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(8)),
                  color: Color(0xFF272E32),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          day,
                          day,
                          daytoday,
                          day,
                          day,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          )));

  Widget website() => Container(
        decoration: BoxDecoration(
          border: Border.all(width: 5, color: Color(0xFF1A1E21)),
          borderRadius: const BorderRadius.all(const Radius.circular(8)),
        ),
        margin: const EdgeInsets.all(4),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Page()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: Color(0xFF464178),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Website",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
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
        ),
      );

  Widget moodle1() => Container(
        decoration: BoxDecoration(
          border: Border.all(width: 5, color: Color(0xFF1A1E21)),
          borderRadius: const BorderRadius.all(const Radius.circular(8)),
        ),
        margin: const EdgeInsets.all(4),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Page()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: Color(0xFFDF7B7B),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Moodle",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Lecture",
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

  Widget moodle2() => Container(
    decoration: BoxDecoration(
      border: Border.all(width: 5, color: Color(0xFF1A1E21)),
      borderRadius: const BorderRadius.all(const Radius.circular(8)),
    ),
    margin: const EdgeInsets.all(4),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Page()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: Color(0xFF36E0B3),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Text(
                "Moodle",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Tutorial",
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

  Widget stream() => Container(
        decoration: BoxDecoration(
          border: Border.all(width: 5, color: Color(0xFF1A1E21)),
          borderRadius: const BorderRadius.all(const Radius.circular(8)),
        ),
        margin: const EdgeInsets.all(4),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Page()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: Color(0xFFF1A163),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Stream",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
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
        ),
      );

  Widget day = Container(
      child: Padding(
    padding: const EdgeInsets.only(left: 6, right: 6),
    child: CustomPaint(
      painter: RoundedImageBorder(isOnline: false),
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        child: Text(
          "Mon",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
    ),
  ));

  Widget daytoday = Container(
      child: Padding(
    padding: const EdgeInsets.only(left: 6, right: 6),
    child: CustomPaint(
      painter: RecImageBorder(),
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        child: Text(
          "Mon",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
    ),
  ));

  Widget task1() => Container(
    decoration: BoxDecoration(
      border:
      Border.all(width: 5, color: Color(0xFF1A1E21)),
      borderRadius: const BorderRadius.all(
          const Radius.circular(8)),
    ),
    margin: const EdgeInsets.all(4),
    child: Container(
      decoration: BoxDecoration(
        borderRadius:
        const BorderRadius.all(Radius.circular(30)),
        color: Color(0xFF272E32),
      ),
      child: Row(
        children: <Widget>[
          new Checkbox(
            value: f1,
            onChanged: (bool value) {
              setState(() {
                f1 = value;
              });
            },
            checkColor: Colors.white,
            activeColor: Color(0xFF464178),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Went to Tutorial",
            style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );

  Widget task2() => Container(
    decoration: BoxDecoration(
      border:
      Border.all(width: 5, color: Color(0xFF1A1E21)),
      borderRadius: const BorderRadius.all(
          const Radius.circular(8)),
    ),
    margin: const EdgeInsets.all(4),
    child: Container(
      decoration: BoxDecoration(
        borderRadius:
        const BorderRadius.all(Radius.circular(30)),
        color: Color(0xFF272E32),
      ),
      child: Row(
        children: <Widget>[
          new Checkbox(
            value: f2,
            onChanged: (bool value) {
              setState(() {
                f2 = value;
              });
            },
            checkColor: Colors.white,
            activeColor: Color(0xFF464178),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Done Homework",
            style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );

  Widget task3() => Container(
    decoration: BoxDecoration(
      border:
      Border.all(width: 5, color: Color(0xFF1A1E21)),
      borderRadius: const BorderRadius.all(
          const Radius.circular(8)),
    ),
    margin: const EdgeInsets.all(4),
    child: Container(
      decoration: BoxDecoration(
        borderRadius:
        const BorderRadius.all(Radius.circular(30)),
        color: Color(0xFF272E32),
      ),
      child: Row(
        children: <Widget>[
          new Checkbox(
            value: f3,
            onChanged: (bool value) {
              setState(() {
                f3 = value;
              });
            },
            checkColor: Colors.white,
            activeColor: Color(0xFF464178),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Watched Livestream",
            style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );

}
