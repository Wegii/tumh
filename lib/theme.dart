import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColorBackground = Color(0xFF1A1E21);
Color primaryColorCheckbox = Color(0xFF464178);
Color primaryColorRow = Color(0xFF7B778E);
Color lectureColorRow = Color(0xFF123456);
Color tutorialColorRow = Color(0xFF623456);
Color homeworkColorRow = Color(0xFF934496);
Color currentDayColorRow = Color(0xFF464178);
Color fullColorTile = Color(0xFF272E32);
Color defaultColorIcon = Colors.white;
Color shadowColor = Color(0x66584b4b);

TextStyle smallHeaderStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22);
TextStyle extraLargeLetter =
    TextStyle(color: Colors.white, fontSize: 55, fontWeight: FontWeight.w900);
TextStyle largeLetter =
    TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold);
TextStyle smallLetter = TextStyle(color: Colors.grey);
TextStyle smallSubLetter =
    TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w800);
TextStyle mediumBoldLetter =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15);
TextStyle mediumLetter = TextStyle(color: Colors.white, fontSize: 15);
TextStyle dayLetter =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w800);
TextStyle taskLetter =
    TextStyle(color: Colors.white70, fontSize: 17, fontWeight: FontWeight.w700);
TextStyle informationLetter =
    TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
TextStyle subInformationLetter =
    TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w700);

TextStyle welcomeLetter = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: Colors.white, fontSize: 35, fontWeight: FontWeight.w600));

TextStyle bodyTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.grey.shade600,
);

final theme = ThemeData(
    canvasColor: Colors.white,
    primarySwatch: Colors.blue,
    fontFamily: 'Oxygen');

final colours = [
  Color(0xFF464178),
  Color(0xFFDF7B7B),
  Color(0xFF36E0B3),
  Color(0xFFF1A163),
  Color(0xFF15799E),
  Color(0xFF5F2D73)
];
