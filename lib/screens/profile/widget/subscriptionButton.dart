import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class SubscriptionButton extends StatelessWidget {
  String text;
  IconData icon;
  Color color;
  SubscriptionButton({required this.text, required this.icon,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment:
        Alignment.center,
        height: 6.h,
        width: 60.w,
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
              .circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 2.w,),
            Icon(icon,color: color,),
          ],
        )
    );
  }
}