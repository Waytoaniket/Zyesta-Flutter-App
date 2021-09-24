import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  String text;
  CustomButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
      Alignment.center,
      height: 50,
      width: 100,
      decoration:
      BoxDecoration(
        gradient:
        LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7A19AD),
            Color(0xFF9F1999),
            Color(0xFFBB1989),
            Color(0xFFDF1875),
          ],
          stops: [0.1, 0.4, 0.7, 0.9],
        ),
        borderRadius:
        BorderRadius
            .circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}