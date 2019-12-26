import 'package:flutter/material.dart';
import 'model/page.dart';
import 'model/home.dart';
import 'package:tumh/theme.dart';

void main() {
  runApp(MaterialApp(
    title: 'TUM helper',
    initialRoute: '/',
    theme: theme,
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => HomePage(),
      '/page': (context) => Page(),
    },
  ));
}
