import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/NewEvent/hostEvent.dart';
import 'package:zyesta_app/screens/Payments/subscriptions.dart';
import 'package:zyesta_app/screens/Settings/settings.dart';
import 'package:zyesta_app/screens/login/login_screen.dart';
import 'package:zyesta_app/screens/profile/widget/customButton.dart';
import 'package:zyesta_app/screens/profile/widget/inputField.dart';
import 'package:zyesta_app/screens/profile/widget/profile_widgets.dart';
import 'package:zyesta_app/screens/profile/widget/subscriptionButton.dart';
import 'package:zyesta_app/services/api.dart';
import 'package:zyesta_app/services/auth_login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zyesta_app/utils/const.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:date_time_format/date_time_format.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  final Function? callback;
  ProfileScreen({Key? key, this.callback});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _about =
      TextEditingController(text: Constants.userData.about);
  TextEditingController _interests =
      TextEditingController(text: Constants.userData.interests);
  TextEditingController _jobTitle =
      TextEditingController(text: Constants.userData.job_role);
  TextEditingController _company =
      TextEditingController(text: Constants.userData.company);
  TextEditingController _university =
      TextEditingController(text: Constants.userData.university);
  TextEditingController _firstName =
      TextEditingController(text: Constants.userData.firstName);
  TextEditingController _lastName =
      TextEditingController(text: Constants.userData.lastName);
  TextEditingController _userName =
      TextEditingController(text: Constants.userData.username);
  TextEditingController _email =
      TextEditingController(text: Constants.userData.email);
  TextEditingController _age =
      TextEditingController(text: Constants.userData.age.toString());
  TextEditingController _gender =
      TextEditingController(text: Constants.userData.gender);
  TextEditingController _mobileNumber =
      TextEditingController(text: Constants.userData.mobile);
  TextEditingController _city =
      TextEditingController(text: Constants.userData.city);

  final _formKey = GlobalKey<FormState>();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');
  final ageValidator = MultiValidator([
    RequiredValidator(errorText: 'Age is required'),
    RangeValidator(errorText: 'Put valid age', min: 18, max: 150)
  ]);

  bool _status = true;
  bool value = true;
  bool isLoading = false;

  var accessToken = Constants.userData.accesstoken;
  var userName = Constants.userData.username;
  String profileImageUrl = "";
  String finalImageUrl = "https://zyestabackendcloud.s3.us-east-2.amazonaws.com/${Constants.userData.profileImageUrl}" +
      '#' +
      Random().nextInt(100000000).toString();
  var result = 'false';

  final picker = ImagePicker();
  String profileImage = Constants.noProfileUrl;

  bool userNameTaken = false;

  void getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    profileImage = pickedFile!.path;
    File imageFile = new File(profileImage);
    loading();
    await AuthService().changeProfileImage(accessToken, imageFile);
    await getProfileData();
    loading();
  }

  @override
  void initState() {
    userNameTaken = false;
    // isLoading = true;
    // () async {
    //   await getProfileData();
    //   setState(() {
    //     isLoading = false;
    //     // Update your UI with the desired changes.
    //   });
    // }();
    super.initState();
  }

  getProfileData() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = Constants.userData.accesstoken;
    userName = Constants.userData.username;
    print(accessToken);
    print("trying to get profile data");
    await AuthService().getAuthProfileData(accessToken, userName).then((val) {
      if (val.data['success']) {
        setState(() {
          print(val.data['user']['username']);
          profileImageUrl = val.data['user']['profileImageUrl'];
          Constants.userData.profileImageUrl = profileImageUrl;
          finalImageUrl =
              "https://zyestabackendcloud.s3.us-east-2.amazonaws.com/$profileImageUrl" +
                  '#' +
                  Random().nextInt(100000000).toString();
          print(finalImageUrl);
          _about = TextEditingController(text: val.data['user']['about']);
          _interests =
              TextEditingController(text: val.data['user']['interests']);
          _jobTitle = TextEditingController(text: val.data['user']['job_role']);
          _company = TextEditingController(text: val.data['user']['company']);
          _university =
              TextEditingController(text: val.data['user']['university']);
          _firstName =
              TextEditingController(text: val.data['user']['firstName']);
          _lastName = TextEditingController(text: val.data['user']['lastName']);
          _age =
              TextEditingController(text: (val.data['user']['age']).toString());
          _gender = TextEditingController(text: val.data['user']['gender']);
          _city = TextEditingController(text: val.data['user']['city']);
          _userName = TextEditingController(text: val.data['user']['username']);
          _email = TextEditingController(text: val.data['user']['email']);
          _mobileNumber =
              TextEditingController(text: val.data['user']['mobile']);

          result = 'true';
        });
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      opacity: 0.5,
      progressIndicator: SpinKitFadingCircle(
        color: Color(0xFF7819AD),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              if (widget.callback != null) widget.callback!();
            },
          ),
          title: Text('My Profile'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppTheme.buttoncolorgradient,
            ),
          ),
        ),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)),
                    color: Colors.white,
                  ),

                  // Profile Body
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w, left: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          SizedBox(
                            height: 8.h,
                          ),

                          Text(_firstName.text+" "+_lastName.text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),),

                          // Profile Options
                          _status
                              ? Container(
                                  padding: boxPadding,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                          splashColor: Colors.blue,
                                          onTap: () {
                                            Navigator.pushNamed(context, Settings.id);
                                          },
                                          child: Column(
                                            children: [
                                              EditProfileWidget(
                                                icon: Icons.settings,
                                              ),
                                              Text(
                                                'Settings',
                                                style:
                                                    AppTheme.kHeadingTextStyle,
                                              )
                                            ],
                                          )),
                                      InkWell(
                                          splashColor: Colors.blue,
                                          onTap: () {
                                            getImage();
                                          },
                                          child: Column(
                                            children: [
                                              EditProfileWidget(
                                                icon: Icons.upload_file,
                                              ),
                                              Text(
                                                'Upload Image',
                                                style:
                                                    AppTheme.kHeadingTextStyle,
                                              )
                                            ],
                                          )),
                                      InkWell(
                                          splashColor: Colors.blue,
                                          onTap: () {
                                            setState(() {
                                              _status = false;
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              EditProfileWidget(
                                                icon: Icons.edit,
                                              ),
                                              Text(
                                                'Edit Info',
                                                style:
                                                    AppTheme.kHeadingTextStyle,
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                )
                              : Container(),

                          SizedBox(
                            height: 2.h,
                          ),

                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextParaInput(
                                    node: node,
                                    status: _status,
                                    heading: "About Me",
                                    cont: _about,
                                    requiredValidator: requiredValidator),
                                SizedBox(
                                  height: 2.h,
                                ),

                                //Interests
                                TextParaInput(
                                    node: node,
                                    status: _status,
                                    heading: "Interests",
                                    cont: _interests,
                                    requiredValidator: requiredValidator),

                                SizedBox(
                                  height: 2.h,
                                ),

                                //Job & Education
                                TextJobInput(
                                    node: node,
                                    status: _status,
                                    jobTitle: _jobTitle,
                                    company: _company,
                                    university: _university),
                                SizedBox(
                                  height: 2.h,
                                ),

                                //Personal Details
                                TextPersonalDetailsInput(
                                    node: node,
                                    status: _status,
                                    firstName: _firstName,
                                    requiredValidator: requiredValidator,
                                    lastName: _lastName,
                                    age: _age,
                                    ageValidator: ageValidator,
                                    gender: _gender,
                                    city: _city),
                                SizedBox(
                                  height: 2.h,
                                ),

                                !_status
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  isLoading = !isLoading;
                                                });
                                                await AuthService()
                                                    .updateAuthProfileData(
                                                        accessToken,
                                                        _about.text,
                                                        _interests.text,
                                                        _jobTitle.text,
                                                        _company.text,
                                                        _university.text,
                                                        _firstName.text,
                                                        _lastName.text,
                                                        _age.text,
                                                        _gender.text,
                                                        _city.text);
                                                setState(() {
                                                  _status = !_status;
                                                });
                                                await getProfileData();
                                                setState(() {
                                                  isLoading = !isLoading;
                                                });
                                              }
                                            },
                                            child: CustomButton(
                                              text: "Update Profile",
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              setState(() {
                                                _status = !_status;
                                              });
                                              setState(() {
                                                isLoading = !isLoading;
                                              });
                                              await getProfileData();
                                              setState(() {
                                                isLoading = !isLoading;
                                              });
                                            },
                                            child: CustomButton(
                                              text: "Cancel",
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                          ),

                          _status
                              ? Container(
                                  padding: boxPadding,
                                  width: 80.w,
                                  decoration: boxProfileDecoration,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Profile Details',
                                          style: profileHeading),

                                      // Username Change
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: Color(0xFF7819AD),
                                            size: 4.w,
                                          ),
                                          Text(' Username  ',
                                              style: subHeading),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Expanded(
                                            child: TextField(
                                              style: contentHeading,
                                              decoration:
                                                  profileInputDecoration,
                                              enabled: false,
                                              autofocus: false,
                                              controller: _userName,
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.blue,
                                            onTap: () {
                                              _userNameChange(
                                                context,
                                                accessToken,
                                                loading,
                                                getProfileData,
                                              );
                                            },
                                            child: editProfileIcon(),
                                          ),
                                        ],
                                      ),

                                      // Email Change
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.email,
                                            color: Color(0xFF7819AD),
                                            size: 4.w,
                                          ),
                                          Text(' Email ID       ',
                                              style: subHeading),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Expanded(
                                            child: TextField(
                                              style: contentHeading,
                                              decoration:
                                                  profileInputDecoration,
                                              enabled: false,
                                              autofocus: false,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: null,
                                              controller: _email,
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.blue,
                                            onTap: () {
                                              _emailChange(context, accessToken,
                                                  loading, getProfileData);
                                            },
                                            child: editProfileIcon(),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),

                                      //Password Change
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.lock,
                                            color: Color(0xFF7819AD),
                                            size: 4.w,
                                          ),
                                          Text(' Password   ',
                                              style: subHeading),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Expanded(
                                              child: Text(
                                            "**********",
                                            style: contentHeading,
                                          )),
                                          InkWell(
                                            splashColor: Colors.blue,
                                            onTap: () {
                                              _passwordChange(context,
                                                  accessToken, loading);
                                            },
                                            child: editProfileIcon(),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),

                                      // Mobile No change
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.call,
                                            color: Color(0xFF7819AD),
                                            size: 4.w,
                                          ),
                                          Text(' Mobile No   ',
                                              style: subHeading),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Expanded(
                                            child: TextField(
                                              style: contentHeading,
                                              decoration:
                                                  profileInputDecoration,
                                              enabled: false,
                                              autofocus: false,
                                              maxLines: null,
                                              controller: _mobileNumber,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              _mobileNoChange(
                                                  context,
                                                  accessToken,
                                                  loading,
                                                  getProfileData);
                                            },
                                            child: editProfileIcon(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),

                          SizedBox(
                            height: 4.h,
                          ),

                          //Host Your Own Event
                          _status
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.popAndPushNamed(
                                        context, HostNewEvent.id);
                                  },
                                  child: HostEventButton(
                                    text: "Host Your Own Event",
                                  ),
                                )
                              : Container(),

                          SizedBox(
                            height: 4.h,
                          ),

                          _status
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "----------  ",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Image.asset(
                                          "assets/images/subscriptions/subscription.png",
                                          height: 13,
                                          width: 185,
                                        ),
                                        Text(
                                          "   ----------",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (ctx) =>
                                                ZyestaAdvance(ctx));
                                      },
                                      child: SubscriptionButton(
                                          text: "Zyesta Advance",
                                          icon: Icons.star,
                                          color: Color(0xFF2EE5F2)),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (ctx) =>
                                                ZyestaPremium(ctx));
                                      },
                                      child: SubscriptionButton(
                                          text: "Zyesta Premium",
                                          icon: FontAwesomeIcons.crown,
                                          color: Color(0xFFFDF100)),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5.h,
                left: 34.w,
                child: Container(
                    height: 100.w / 3,
                    width: 100.w / 3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: FadeInImage(
                        image: NetworkImage(finalImageUrl),
                        placeholder: AssetImage(
                            "assets/images/registration/loading.gif"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                              'assets/images/registration/noprofileround.jpg',
                              fit: BoxFit.fitWidth);
                        },
                        fit: BoxFit.fitWidth,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}

//password Change Function
_passwordChange(context, accessToken, Function loading) {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _oldPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character'),
  ]);
  Alert(
      context: context,
      title: "Change Password",
      style: AlertStyle(titleStyle: profileHeading),
      content: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.bottom,
              controller: _oldPassword,
              obscureText: true,
              validator: requiredValidator,
              decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Color(0xFF7819AD)),
                labelText: 'Old Password',
                labelStyle: TextStyle(
                  color: Color(0xFF7819AD),
                ),
              ),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.bottom,
              controller: _newPassword,
              obscureText: true,
              validator: passwordValidator,
              decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Color(0xFF7819AD)),
                labelText: 'New Password',
                labelStyle: TextStyle(
                  color: Color(0xFF7819AD),
                ),
              ),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.bottom,
              controller: _confirmPassword,
              obscureText: true,
              validator: (val) =>
                  MatchValidator(errorText: 'passwords do not match')
                      .validateMatch(_confirmPassword.text, _newPassword.text),
              decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Color(0xFF7819AD)),
                labelText: 'Confirm New Password',
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
            if (_formKey.currentState!.validate()) {
              Navigator.of(context, rootNavigator: true).pop();
              loading();
              await AuthService().changeUserPassword(
                  accessToken, _oldPassword.text, _newPassword.text);
              loading();
            }
          },
          gradient: AppTheme.buttonGradient,
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}

//email Change Function
_emailChange(context, accessToken, Function loading, Function getProfileData) {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _password = TextEditingController();
  TextEditingController _newEmail = TextEditingController();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'enter a valid email address')
  ]);
  Alert(
      context: context,
      title: "Change Email",
      style: AlertStyle(titleStyle: profileHeading),
      content: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.bottom,
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
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.bottom,
              controller: _newEmail,
              validator: emailValidator,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.mail,
                  color: Color(0xFF7819AD),
                ),
                labelText: 'New Email',
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
            if (_formKey.currentState!.validate()) {
              Navigator.of(context, rootNavigator: true).pop();
              loading();
              await AuthService()
                  .changeUserEmail(accessToken, _password.text, _newEmail.text);
              await getProfileData();
              loading();
            }
          },
          gradient: AppTheme.buttonGradient,
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}

//MobileNo Change Function
_mobileNoChange(
    context, accessToken, Function loading, Function getProfileData) {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _password = TextEditingController();
  TextEditingController _newMobileNo = TextEditingController();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');
  final mobileNumValidator = MultiValidator([
    RequiredValidator(errorText: 'Mobile Number is required'),
    PatternValidator(r'^[6-9]\d{9}$', errorText: 'Enter valid phone Number')
  ]);
  Alert(
      context: context,
      title: "Change MobileNumber",
      style: AlertStyle(titleStyle: profileHeading),
      content: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.bottom,
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
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.bottom,
              controller: _newMobileNo,
              validator: mobileNumValidator,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.call,
                  color: Color(0xFF7819AD),
                ),
                labelText: 'New Mobile Number',
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
            if (_formKey.currentState!.validate()) {
              Navigator.of(context, rootNavigator: true).pop();
              loading();
              await AuthService().changeUserMobileNo(
                  accessToken, _password.text, _newMobileNo.text);
              await getProfileData();
              loading();
            }
          },
          gradient: AppTheme.buttonGradient,
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}

//Username Change Function
_userNameChange(
    context, accessToken, Function loading, Function getProfileData) {
  bool userSearchIndicator = false;
  bool userNameTaken = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  final node = FocusScope.of(context);

  showDialog(
    context: context,
    builder: (context) {
      String contentText = "Content of Dialog";
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            buttonPadding: EdgeInsets.only(right: 12.w),
            title: Text(
              "        Change Username",
            ),
            titleTextStyle: profileHeading,
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onFieldSubmitted: (value) {},
                    onEditingComplete: () => node.nextFocus(),
                    keyboardType: TextInputType.text,
                    textAlignVertical: TextAlignVertical.bottom,
                    controller: _username,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xFF7819AD),
                      ),
                      labelText: 'New Username',
                      labelStyle: TextStyle(
                        color: Color(0xFF7819AD),
                      ),
                      suffixIcon: userSearchIndicator
                          ? Transform.scale(
                              scale: 0.5,
                              child: SizedBox(
                                child: CircularProgressIndicator(
                                  color: AppTheme.primaryColor,
                                ),
                                height: 10.0,
                                width: 10.0,
                              ),
                            )
                          : SizedBox(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        userSearchIndicator = true;
                      });
                      if (value != null) {
                        ApiProvider().userNameValidation(
                            {'username': value}).then((response) {
                          if (response['success']) {
                            setState(() {
                              userNameTaken = false;
                            });
                          } else {
                            setState(() {
                              userNameTaken = true;
                            });
                          }
                          setState(() {
                            userSearchIndicator = false;
                          });
                        });
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Unique UserName';
                      } else if (userNameTaken) {
                        print('userNameTaken');
                        return 'UserName Already Taken';
                      } else {
                        print(userNameTaken);
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              DialogButton(
                width: 50.w,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context, rootNavigator: true).pop();
                    loading();
                    await AuthService()
                        .changeUserName(accessToken, _username.text);
                    await getProfileData();
                    loading();
                  }
                },
                gradient: AppTheme.buttonGradient,
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          );
        },
      );
    },
  );
}

