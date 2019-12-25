import 'package:flutter/material.dart';
import 'model/page.dart';
import 'model/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'TUM helper',
    initialRoute: '/',
    theme: ThemeData(
        canvasColor: Colors.white,
        primarySwatch: Colors.blue,
        fontFamily: 'Oxygen'),
    routes: {
      '/': (context) => HomePage(),
      '/page': (context) => Page(),
    },
  ));
}
