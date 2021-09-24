import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/IntroScreens/second_intro.dart';
import 'package:page_transition/page_transition.dart';

class FirstIntro extends StatefulWidget {
  static const String id = 'intro_screen';

  @override
  _FirstIntroState createState() => _FirstIntroState();
}

class _FirstIntroState extends State<FirstIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dx < -sensitivity) {
            setState(() {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds: 500),
                      child: SecondIntro()));
            });
          }
        },
        child: Container(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              Container(
                height: 65.h,
                width: 100.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/IntroImages/intro1.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 7.h),
                height: 35.h,
                width: 100.w,
                color: Color.fromARGB(255, 12, 27, 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/IntroImages/heading1.png"),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Choose your favourite Events and\ncelebrate with your loved ones.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lens,
                          color: Color(0xFFDF1875),
                          size: 20,
                        ),
                        Icon(
                          Icons.lens_outlined,
                          color: Color(0xFFDF1875),
                          size: 20,
                        ),
                        Icon(
                          Icons.lens_outlined,
                          color: Color(0xFFDF1875),
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
