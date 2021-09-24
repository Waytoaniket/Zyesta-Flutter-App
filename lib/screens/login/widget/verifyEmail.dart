import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zyesta_app/screens/login/widget/customButton.dart';
import 'package:zyesta_app/screens/login/widget/textHeading.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/services/auth_login.dart';

Widget verificationEmail(context, TextEditingController verifyEmail, Function loading){
  final node = FocusScope.of(context);
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(4.0)),
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 250,
                      child: Padding(
                        padding:
                        const EdgeInsets.fromLTRB(
                            10, 70, 10, 10),
                        child: Column(
                          children: [
                            TextHeading(text: 'Enter registered email below for verification'),
                            SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Container(
                                padding: EdgeInsets.only(bottom: 10),
                                alignment:
                                Alignment.center,
                                decoration:
                                BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100.w),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6.0,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  onFieldSubmitted: (value) {},
                                  onEditingComplete: () => node.nextFocus(),
                                  style: TextStyle(
                                    color: Color(
                                        0xFF7819AD), //TextFormField title background color change
                                  ),
                                  decoration:
                                  InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 15, top: 17, right: 15),
                                    hintStyle: TextStyle(
                                      color: Color(0xFF7819AD),
                                    ),
                                  ),
                                  controller: verifyEmail,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                Navigator.of(context)
                                    .pop();
                                try {
                                  loading();
                                  await AuthService()
                                      .verifyEmail(verifyEmail.text)
                                      .then((val) {
                                    if (val.data['success']) {
                                      print(val.data['success']);
                                      loading();
                                      Fluttertoast.showToast(
                                        msg: 'Verification Email Sent!',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        backgroundColor: Color(0xFF7819AD),
                                        textColor: Colors.white,
                                        fontSize: 16,
                                      );
                                    }
                                  });
                                } catch (e) {
                                  loading();
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 30, left: 30),
                                child: CustomButton(text: "Send",),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: -50,
                        child: CircleAvatar(
                          backgroundColor:
                          Color(0xFFBB1989),
                          radius: 50,
                          child: Icon(
                            Icons.email,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),),
                  ],
                ));
          });
    },
    child: Center(
        child: TextHeading(text: "Resend Verification Email?",)),
  );
}

