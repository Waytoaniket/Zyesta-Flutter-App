import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/Payments/CustomButton.dart';

Widget ZyestaAdvance(ctx) {
  return AlertDialog(
    titlePadding: EdgeInsets.zero,
    contentPadding:  EdgeInsets.zero,
    title: Container(
      width: 100.w,
      height: 8.h,
      color: Color(0xFF7819AD),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Zyesta Advanced",
            style: TextStyle(
              color: Color(0xFF2EE5F2),
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Icon(
            Icons.star,
            color: Color(0xFF2EE5F2),
          ),
        ],
      ),
    ),
    content: Container(
      decoration: BoxDecoration(
        gradient: AppTheme.lightbackgroundcolorgradient,
      ),
      height: 38.h,
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "• AD Free\n\n• Host your own event (Choose\n  only premium or generic)\n\n• 5 Boost up per month\n\n• View who viewed your profile",
                style: TextStyle(
                  color: Color(0xFF7819AD),
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 3.h,),
              GestureDetector(child: CustomButton(text: "Rs 199 per month",color:Color(0xFF2EE5F2) ,)),
              SizedBox(height: 1.h,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(ctx);
                },
                child: Text("No thanks",style: TextStyle(
                  decoration: TextDecoration.underline,
                    color: Color(0xFF7819AD),
          fontSize: 12.sp,
      ),),
              )
            ],
          ),
        )
      ),
    ),
  );
}

Widget ZyestaPremium(ctx) {
  return AlertDialog(
    titlePadding: EdgeInsets.zero,
    contentPadding:  EdgeInsets.zero,
    title: Container(
      width: 100.w,
      height: 8.h,
      color: Color(0xFF7819AD),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Zyesta Premium",
            style: TextStyle(
              color: Color(0xFFFDF100),
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Icon(
            FontAwesomeIcons.crown,
            color: Color(0xFFFDF100),
          ),
        ],
      ),
    ),
    content: Container(
      decoration: BoxDecoration(
        gradient: AppTheme.lightbackgroundcolorgradient,
      ),
      height: 57.h,
      child: Padding(
          padding: EdgeInsets.all(5.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "• AD Free\n\n• Host your own event (Choose\n  only premium or generic)\n\n• 5 Boost up per month\n\n• Get access to only\n  permium class event/zone\n\n• Send event invite to people\n\n• View who viewed your profile\n\n• Get access to discounts and\n  offers custom made for\n  premium class",
                  style: TextStyle(
                    color: Color(0xFF7819AD),
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 3.h,),
                GestureDetector(child: CustomButton(text: "Rs 299 per month",color:Color(0xFFFDF100) ,)),
                SizedBox(height: 1.h,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(ctx);
                  },
                  child: Text("No thanks",style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xFF7819AD),
                    fontSize: 12.sp,
                  ),),
                )
              ],
            ),
          )
      ),
    ),
  );
}
