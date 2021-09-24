import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/Settings/widgets/appbar.dart';
import 'package:zyesta_app/screens/Settings/widgets/blocked_users.dart';
import 'package:zyesta_app/screens/Settings/widgets/field.dart';
import 'package:zyesta_app/screens/Settings/widgets/logout.dart';
import 'package:zyesta_app/screens/Settings/widgets/profileImage.dart';
import 'package:zyesta_app/screens/Settings/widgets/settings_design.dart';
import 'package:zyesta_app/screens/Settings/widgets/subscription.dart';
import 'package:zyesta_app/screens/login/login_screen.dart';
import 'package:zyesta_app/services/auth_login.dart';
import 'package:zyesta_app/utils/const.dart';

class Settings extends StatefulWidget {
  static const String id = 'settings_screen';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String finalImageUrl =
      "https://zyestabackendcloud.s3.us-east-2.amazonaws.com/${Constants.userData.profileImageUrl}" +
          '#' +
          Random().nextInt(100000000).toString();
  bool isLoading = false;
  var accessToken = Constants.userData.accesstoken;

  void loading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      opacity: 0.5,
      progressIndicator: SpinKitFadingCircle(
        color: Color(0xFF7819AD),
      ),
      child: Scaffold(
        appBar: settingAppBar(context),
        body: Container(
          decoration: BoxDecoration(
            gradient: AppTheme.backgroundcolorgradient,
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 9.h),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(Constants.userData.firstName!+" "+Constants.userData.lastName!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),),
                          SizedBox(
                            height: 2.h,
                          ),
                          Subscription(),
                          SizedBox(
                            height: 2.h,
                          ),
                          BlockedUsers(),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            padding: boxPadding,
                            width: 80.w,
                            decoration: boxSettingDecoration,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Account", style: settingHeading),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Logout(),
                                GestureDetector(
                                  onTap: () {
                                    final _formKey = GlobalKey<FormState>();
                                    TextEditingController _password =
                                        TextEditingController();
                                    final requiredValidator = RequiredValidator(
                                        errorText: 'Password Required');
                                    Alert(
                                        context: context,
                                        title: "Delete Account",
                                        style: AlertStyle(
                                            titleStyle: settingHeading),
                                        content: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: <Widget>[
                                              TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                keyboardType:
                                                    TextInputType.text,
                                                textAlignVertical:
                                                    TextAlignVertical.bottom,
                                                controller: _password,
                                                obscureText: true,
                                                validator: requiredValidator,
                                                decoration: InputDecoration(
                                                  icon: Icon(
                                                    Icons.lock,
                                                    color: Color(0xFF7819AD),
                                                  ),
                                                  labelText: 'Password',
                                                  labelStyle: TextStyle(
                                                    color: Color(0xFF7819AD),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        buttons: [
                                          DialogButton(
                                            onPressed: () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop();
                                                loading();
                                                await AuthService()
                                                    .deleteProfile(
                                                        context,
                                                        accessToken,
                                                        _password.text);
                                                loading();
                                              }
                                            },
                                            gradient: AppTheme.buttonGradient,
                                            child: Text(
                                              "Confirm Delete",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          )
                                        ]).show();
                                  },
                                  child: Field(
                                    icon: FontAwesomeIcons.trash,
                                    fieldHeading: "Delete Account",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ProfileImage(finalImageUrl: finalImageUrl),
            ],
          ),
        ),
      ),
    );
  }
}


