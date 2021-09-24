import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TextHeading extends StatelessWidget {
  String text;
  TextHeading({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Color(0xFF7819AD),
        fontSize: 10.sp,
      ),
    ),
    );
  }
}