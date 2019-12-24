import 'package:flutter/material.dart';
import 'package:tumh/model/landing.dart';
import 'model/page.dart';
import 'model/home.dart';
import 'model/landing.dart';

void main() {
  runApp(MaterialApp(
    title: 'TUM helper',
    initialRoute: '/',
    theme: ThemeData(
        canvasColor: Colors.white,
        primarySwatch: Colors.blue,
        fontFamily: 'Oxygen'),
    routes: {
      '/': (context) => LandingPage(),
      '/home': (context) => HomePage(),
      '/page': (context) => Page(),
    },
  ));
}
