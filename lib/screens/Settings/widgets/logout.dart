import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zyesta_app/screens/Settings/widgets/settings_design.dart';
import 'package:zyesta_app/screens/login/login_screen.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/Settings/widgets/field.dart';

class Logout extends StatelessWidget {
  const Logout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Alert(
            context: context,
            title: "Confirm Logout ?",
            style: AlertStyle(
                titleStyle: settingHeading),
            buttons: [
              DialogButton(
                onPressed: () async {
                  Navigator.of(context, rootNavigator: true).pop();
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  await preferences.clear();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(LoginScreen.id, (Route<dynamic> route) => false);
                },
                gradient: AppTheme.buttonGradient,
                child: Text(
                  "Yes",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20),
                ),
              )
            ]
        ).show();
      },
      child: Field(
        icon: FontAwesomeIcons.powerOff,
        fieldHeading: "Log Out",
      ),
    );
  }
}