
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/Registration/widget/appbar.dart';
import 'package:zyesta_app/screens/Registration/widget/registrationbutton.dart';
import 'package:zyesta_app/screens/Registration/widget/inputfield.dart';
import 'package:zyesta_app/screens/Registration/widget/profile.dart';
import 'package:zyesta_app/screens/model/userdatamodel.dart';

import 'package:zyesta_app/services/api.dart';
import 'package:zyesta_app/utils/const.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'register_screen';

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  String profileImage = Constants.noProfileUrl;

  bool passwordNotVisible = true;
  bool confirmedPasswordNotVisible = true;
  bool userNmaeTaken = false;
  bool userSearchIndicator = false;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ModalProgressHUD(
      progressIndicator: CircularProgressIndicator(
        color: AppTheme.primaryColor,
      ),
      inAsyncCall: isLoading,
      child: Container(
          decoration: new BoxDecoration(
            gradient: AppTheme.backgroundcolorgradient
           
          ),
          child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        appBar(context),
                        getProfile(size, profileImage, getImage),
                        SizedBox(
                          height: size.width / 8,
                        ),
                        getInputField(
                            size,
                            context,
                            _userName,
                            _firstName,
                            _lastName,
                            _email,
                            _password,
                            _confirmPassword,
                            _age,
                            _gender,
                            _mobileNumber,
                            _city,
                            passwordNotVisible,
                            confirmedPasswordNotVisible,
                            userNmaeTaken,
                            userSearchIndicator,
                            changePasswordVisibility,
                            changeConfirmedPasswordVisibility,
                            _checkUsername,
                            showUserSearchIndicator),
                        SizedBox(
                          height: size.width / 8,
                        ),
                        registrationButton(
                          context,
                          size,
                          _formKey,
                          _userName,
                          _firstName,
                          _lastName,
                          _email,
                          _password,
                          _age,
                          _gender,
                          _mobileNumber,
                          _city,
                          profileImage,
                          updateIndicator,
                          setProfilePic,
                          updateUserData,
                        ),
                        SizedBox(
                          height: size.width / 12,
                        ),
                        Center(
                          child: Text(
                            "or Sign Up with",
                            style: TextStyle(color: AppTheme.primaryColor),
                          ),
                        ),
                        SizedBox(
                          height: size.width / 12,
                        ),
                        Container(
                          width: size.width / 3,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/registration/facebook.png",
                                scale: size.width / 8,
                              ),
                              Image.asset(
                                "assets/images/registration/google.png",
                                scale: size.width / 12,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.width / 12,
                        ),
                      ],
                    ),
                  )))),
    ));
  }

  void updateUserData(UserDataModel userdata) {
    this.setState(() {
      Constants.userData = userdata;
    });
  }

  void updateIndicator() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void setProfilePic() {
    setState(() {
      profileImage = Constants.noProfileUrl;
    });
  }

  void changePasswordVisibility() {
    setState(() {
      passwordNotVisible = !passwordNotVisible;
    });
  }

  void changeConfirmedPasswordVisibility() {
    setState(() {
      confirmedPasswordNotVisible = !confirmedPasswordNotVisible;
    });
  }

  void showUserSearchIndicator() {
    setState(() {
      userSearchIndicator = true;
    });
  }

  void getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      profileImage = pickedFile!.path;
    });
  }

  void _checkUsername(String? username) {
    if (username != null) {
      ApiProvider().userNameValidation({'username': username}).then((response) {
        if (response['success']) {
          setState(() {
            userNmaeTaken = false;
          });
        } else {
          setState(() {
            userNmaeTaken = true;
          });
        }

        setState(() {
          userSearchIndicator = false;
        });
      });
    }
  }
}
