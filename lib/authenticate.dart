import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zyesta_app/screens/HomePage/homescreen.dart';
import 'package:zyesta_app/screens/IntroScreens/first_intro.dart';
import 'package:zyesta_app/screens/model/userdatamodel.dart';
import 'package:zyesta_app/utils/const.dart';

class Authenticate extends StatefulWidget {
  static const String id = 'Authenticate';
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  getUserData() async {
    await SharedPreferences.getInstance().then((value) => {
          if (mounted)
            {
              this.setState(() {
                UserDataModel data = UserDataModel(
                  accesstoken: value.getString('accesstoken'),
                  userId: value.getString('userId'),
                  token: value.getString('token'),
                  verifiedEmail: value.getBool('verifiedEmail'),
                  username: value.getString('username'),
                  firstName: value.getString('firstName'),
                  lastName: value.getString('lastName'),
                  email: value.getString('email'),
                  mobile: value.getString('mobile'),
                  password: value.getString('password'),
                  profileImageUrl: value.getString('profileImageUrl'),
                  age: value.getInt('age'),
                  gender: value.getString('gender'),
                  city: value.getString('city'),
                  about: value.getString('about'),
                  interests: value.getString('interests'),
                  job_role: value.getString('job_role'),
                  company: value.getString('company'),
                  university: value.getString('university'),
                  qualification: value.getString('qualification'),
                );
                Constants.userData = data;
                _saveFile("assets/images/registration/noprofile.png", Constants.noProfileUrl);

              })
            }
        });
  }

  _saveFile(String url, String filePath) async {
    ByteData data = await rootBundle.load(url);
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    final File file = File(filePath);
    await file.writeAsBytes(bytes);
  }

  void isSignIn() async {
     await getUserData();
    if (Constants.userData.userId != "" && Constants.userData.userId != null) {
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    } else {
      Navigator.pushReplacementNamed(context, FirstIntro.id);
    }
  }

  @override
  void initState() {
    super.initState();
    isSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
      )),
    );
  }
}
