import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/IntroScreens/first_intro.dart';
import 'package:zyesta_app/screens/IntroScreens/landing_page.dart';

class SecondIntro extends StatefulWidget {
  static const String id = 'intro_screen2';

  @override
  _SecondIntroState createState() => _SecondIntroState();
}

class _SecondIntroState extends State<SecondIntro> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                        child: LandingPage()));
              });
            }else if(details.delta.dx > sensitivity) {
              setState(() {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 500),
                        child: FirstIntro()));
              });
            }
          },
          child: Container(
            height: 100.h,
            width: 100.w,
            child: Column(
              children: [
                Container(
                  height: 85.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/IntroImages/intro2.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/IntroImages/heading2.png"),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Find people who share your Passions\nand Explore together.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 7.h),
                  height: 15.h,
                  width: 100.w,
                  color: Color.fromARGB(255, 44, 36, 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lens_outlined,
                            color: Color(0xFFDF1875),
                            size: 20,
                          ),
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
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
