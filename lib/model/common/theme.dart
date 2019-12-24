import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String profile = "assets/images/owl.jpg";
const String landingPage_background = "assets/images/dr.png";

Color firstColor = Color(0XFFFC4A1F);
Color secondColor = Color(0XFFAF1055);
Color tertiaryTextColor = Color(0XFFA7A7A7);

BoxDecoration bord() {
  return BoxDecoration(
    border: Border.all(color: Colors.white, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  );
}

TextStyle header = GoogleFonts.roboto(
    textStyle: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w600)
);

TextStyle header1 = GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.white, letterSpacing: .5),
    fontSize: 48,
    //fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold);

TextStyle bodyTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.grey.shade600,
);

