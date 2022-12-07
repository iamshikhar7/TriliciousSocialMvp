import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
   AppLargeText({Key? key,
     required this.text, this.size=30, this.color=Colors.black,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: GoogleFonts.montserrat(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),);
  }
}
