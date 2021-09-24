import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/IntroScreens/landing_page.dart';

Widget appBar(context){
  return Padding(
    padding: EdgeInsets.only(left: 2.w),
    child: Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF7819AD),
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, LandingPage.id);
          },
        ),
        Text('Welcome Back!', style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Color(0xFF7819AD),
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
          ),
        ),
        ),
      ],
    ),
  );
}