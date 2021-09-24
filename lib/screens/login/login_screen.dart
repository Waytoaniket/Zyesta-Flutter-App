import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/HomePage/homescreen.dart';
import 'package:zyesta_app/screens/Registration/registration_page.dart';
import 'package:zyesta_app/screens/login/widget/appBar.dart';
import 'package:zyesta_app/screens/login/widget/appLogo.dart';
import 'package:zyesta_app/screens/login/widget/backgroundTheme.dart';
import 'package:zyesta_app/screens/login/widget/forgotPassword.dart';
import 'package:zyesta_app/screens/login/widget/inputField.dart';
import 'package:zyesta_app/screens/login/widget/login.dart';
import 'package:zyesta_app/screens/login/widget/textHeading.dart';
import 'package:sizer/sizer.dart';
import 'dart:core';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zyesta_app/screens/model/userdatamodel.dart';
import 'package:zyesta_app/utils/const.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var token;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _verifyEmail = TextEditingController();
  TextEditingController _forgotPassword = TextEditingController();


  bool _passwordVisible = false;
  // bool _isEmailValid = true;
  String emailValid = "";
  bool isLoading = false;

  @override
  void initState() {
    _passwordVisible = false;
    // _isEmailValid = true;
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: Color(0xFF7819AD),
        ),
        inAsyncCall: isLoading,
        child: Stack(
          children: [

            // backgroundTheme of login page
            backgroundTheme,

            // appBar of login page
            Padding(padding:EdgeInsets.only(top: 3.h),child: appBar(context)),

            // body of login page
            Container(
              alignment: Alignment.center,
              height: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      appLogo,
                      SizedBox(
                        height: 80.0,
                      ),
                      TextHeading(text: "  LOGIN CREDENTIALS"),
                      SizedBox(
                        height: 10.0,
                      ),
                      getEmailField(context, _email),
                      SizedBox(
                        height: 10.0,
                      ),
                      getPasswordField(context, _password, _passwordVisible, passwordVisibility),
                      SizedBox(
                        height: 20.0,
                      ),
                      forgotPasswordEmail(context,_forgotPassword,loading),
                      SizedBox(
                        height: 30.0,
                      ),
                      // verificationEmail(context, _verifyEmail, loading),
                      // SizedBox(
                      //   height: 30.0,
                      // ),

                      login(context, _email, _password, loading, token,navigation, updateUserData),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                          child: Text("OR LOGIN WITH",
                              style: AppTheme.kHeadingTextStyle)),
                      SizedBox(
                        height: 20.0,
                      ),
                      //Login FaceBook or Google
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: Image.asset('images/facebook.png',scale: 100.w / 8,),
                          ),
                          GestureDetector(
                            child: Image.asset('images/google.png',scale: 100.w / 12,),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(
                                context, RegistrationPage.id);
                          },
                          child: TextHeading(text: "Don't have an account? Register ",),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void passwordVisibility(){
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
  void loading(){
    setState(() {
      isLoading = !isLoading;
    });
  }

  void navigation(){
    setState(() {
      Navigator.popAndPushNamed(
          context, HomeScreen.id);
    });
  }

void updateUserData(UserDataModel userdata) {
    this.setState(() {
      Constants.userData = userdata;
    });
  }}




