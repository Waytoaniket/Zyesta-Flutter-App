import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color.fromARGB(255, 122, 25, 173);
  static const Color primaryColor1 = Color.fromRGBO(223, 26, 117, 1);

  static const Color darkColor = Color.fromARGB(255, 58, 11, 83);
  static const Color nearlyWhite = Color(0xFFF2F3F8);

  static const Gradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 113, 116, 253),
      Color.fromARGB(255, 221, 148, 240)
    ],
  );

  static const Gradient appBarGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color.fromARGB(220, 221, 26, 118),
      Color.fromARGB(220, 123, 25, 172)
    ],
  );

  static const Gradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromARGB(255, 122, 25, 173),
      Color.fromARGB(255, 223, 26, 117)
    ],
  );
  static Gradient backgroundcolorgradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF71A6FD).withOpacity(0.4),
      Color(0xFF94A0F9).withOpacity(0.4),
      Color(0xFFC997F2).withOpacity(0.4),
      Color(0xFFD695F1).withOpacity(0.4),
    ],
    stops: [0.1, 0.4, 0.7, 0.9],
  );

  static const lightbackgroundcolorgradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color.fromARGB(100, 227, 169, 243),
      Color.fromARGB(100, 142, 184, 253),
    ],
    stops: [0.1, 0.9],
  );
  static TextStyle lighttextStyle(double size,
      {FontWeight weight = FontWeight.normal}) {
    return TextStyle(
      color: AppTheme.primaryColor,
      fontSize: size,
      fontWeight: weight,
    );
  }

  static TextStyle darktextStyle(double size,
      {FontWeight weight = FontWeight.normal}) {
    return TextStyle(
      color: AppTheme.darkColor,
      fontSize: size,
      fontWeight: weight,
    );
  }

  static const buttoncolorgradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF7A19AD),
      Color(0xFF9F1999),
      Color(0xFFBB1989),
      Color(0xFFDF1875),
    ],
    stops: [0.1, 0.4, 0.7, 0.9],
  );

  static final kHeadingTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Color(0xFF7819AD),
      fontSize: 10.sp,
    ),
  );

  static final kBoxDecorationStyle = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(100.w),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  static const textinputdecoration = InputDecoration(
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    contentPadding: EdgeInsets.only(left: 15, top: 17, right: 15),
    hintStyle: TextStyle(
      color: Color(0xFF7819AD),
    ),
  );

  static const inputboxdecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    color: Colors.white,
  );

  static final cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.grey.withOpacity(0.6),
        offset: const Offset(4, 4),
        blurRadius: 16,
      ),
    ],
  );
  static TextStyle heading(fontSize) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        letterSpacing: 0.27,
        color: AppTheme.darkColor,
      );
}
