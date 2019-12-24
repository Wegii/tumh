import 'package:flutter/material.dart';

import 'package:tumh/model/common/theme.dart';
import 'package:tumh/model/home.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    Column col = Column(children: <Widget>[
      Expanded(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(landingPage_background),
            fit: BoxFit.cover,
          ),
        ),
      )),
      Expanded(
          child: Scaffold(
        backgroundColor: Color(0xff67cfff),
        body: RaisedButton(
            color: Colors.red,
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Text(
              "test",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }),
      )),
    ]);
    return col;
  }
}
