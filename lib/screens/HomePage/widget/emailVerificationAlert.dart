import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zyesta_app/screens/login/login_screen.dart';
import 'package:zyesta_app/screens/profile/widget/profile_widgets.dart';
import 'package:zyesta_app/services/api.dart';
import 'package:zyesta_app/utils/const.dart';

import '../../../app_theme.dart';

void emailValidator(context, Function updateEmail) {
  Alert(
      onWillPopActive: true,
      context: context,
      title: "Please Verify Your Email",
      style: AlertStyle(titleStyle: profileHeading),
      closeFunction: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        Navigator.of(context, rootNavigator: true).pop();

        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.id, (route) => false);
      },
      closeIcon: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Signout', style: AppTheme.kHeadingTextStyle),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  Icons.logout,
                  color: AppTheme.primaryColor,
                  size: 20,
                ))
          ],
        ),
      ),
      buttons: [
        DialogButton(
          onPressed: () async {
            ApiProvider().resendEmail({'email': Constants.userData.email}).then(
                (response) {
              print(response);
              if (response != null && response['success']) {
                print(response);
                Fluttertoast.showToast(
                    msg: response['message'],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1);
              } else {
                Fluttertoast.showToast(
                    msg: response['message'] + ' Press Okay To Continue',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1);
              }
            });
          },
          gradient: AppTheme.buttonGradient,
          child: Text(
            "Resend",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed: () async {
            ApiProvider().emailVerification().then((response) {
              print(response);
              if (response != null && response['verifiedEmail']) {
                print(response);
                updateEmail();
                Fluttertoast.showToast(
                    msg: response['message'],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1);
              } else {
                Fluttertoast.showToast(
                    msg: response['message'] + ' Press Resend To Get Link',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1);
              }
            });
          },
          gradient: AppTheme.buttonGradient,
          child: Text(
            "Okay",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}
