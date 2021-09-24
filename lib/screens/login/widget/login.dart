import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zyesta_app/screens/login/widget/customButton.dart';
import 'package:zyesta_app/services/auth_login.dart';
import 'package:sizer/sizer.dart';

Widget login(
    context,
    TextEditingController email,
    TextEditingController password,
    Function loading,
    var token,
    Function navigation,
    Function updateUserData) {
  return Padding(
    padding: EdgeInsets.only(left: 20.w, right: 20.w),
    child: GestureDetector(
      onTap: () async {
        loading();

        if (email.text == "" || password.text == "") {
          Fluttertoast.showToast(
            msg: 'Email/Password cannot be empty!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Color(0xFF7819AD),
            textColor: Colors.white,
            fontSize: 16,
          );
          loading();
        }

        if (email.text != "" || password.text != "") {
          print(email.text);
          print(password.text);
          try {
            print("trying");
            await AuthService()
                .login(email.text, password.text, updateUserData)
                .then((val) {
              if (val.data['success']) {
                token = val.data['token'];
                print("successfull");
                loading();
                Fluttertoast.showToast(
                  msg: 'Welcome Back!',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Color(0xFF7819AD),
                  textColor: Colors.white,
                  fontSize: 16,
                );
                navigation();
              }
            });
          } catch (e) {
            loading();
          }
        }
      },
      child: CustomButton(
        text: "Login",
      ),
    ),
  );
}
