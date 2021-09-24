import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class QrButton extends StatelessWidget {
  QrButton({required this.text,required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment:
        Alignment.center,
        height: 6.h,
        width: 50.w,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon,color: Colors.white,),
            SizedBox(width: 2.w,),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
    );
  }
}