import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zyesta_app/screens/IntroScreens/widgets/backgroundTheme.dart';
import 'package:zyesta_app/screens/IntroScreens/widgets/customButton.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/IntroScreens/second_intro.dart';
import 'package:zyesta_app/screens/Registration/registration_page.dart';
import 'package:zyesta_app/screens/login/login_screen.dart';

class LandingPage extends StatefulWidget {
  static const String id = 'landing_page';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          int sensitivity = 8;
          if(details.delta.dx > sensitivity) {
            setState(() {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      duration: Duration(milliseconds: 500),
                      child: SecondIntro()));
            });
          }
        },
        child: Stack(
          children: [
            backgroundTheme,
            Container(
              height: 100.h,
              width: 100.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'images/logo.png',
                    height: 12.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Image.asset(
                    'assets/images/IntroImages/applogo.png',
                    height: 25.h,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, RegistrationPage.id);
                    },
                      child: CustomButton(text: "Sign Up")),
                  SizedBox(
                    height: 3.h,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                      child: CustomButton(text: "Log in ")),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Color(0xFF7A19AD),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Continue as guest",
                      style: TextStyle(
                          color: Color(0xFF7A19AD),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      Icon(
                        Icons.lens,
                        color: Color(0xFFDF1875),
                        size: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
