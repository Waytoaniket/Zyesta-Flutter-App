import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/OtherProfile/widgets/buttons.dart';
import 'package:zyesta_app/screens/OtherProfile/widgets/design.dart';
import 'package:zyesta_app/screens/OtherProfile/widgets/details.dart';
import 'package:zyesta_app/screens/OtherProfile/widgets/profileImage.dart';
import 'package:zyesta_app/services/auth_login.dart';
import 'package:zyesta_app/services/user_api.dart';
import 'package:zyesta_app/utils/const.dart';

class OtherProfile extends StatefulWidget {
  static const String id = 'other_profile_screen';
  final String userName;

  const OtherProfile({required this.userName}) : super();

  @override
  _OtherProfileState createState() => _OtherProfileState(userName: userName);
}

class _OtherProfileState extends State<OtherProfile> {
  String userName;
  _OtherProfileState({required this.userName});
  var accessToken;

  bool isLoading = false;

  String userId = "";
  String about = "";
  String interests = "";
  String jobTitle = "";
  String company = "";
  String university = "";
  String firstName = "";
  String lastName = "";
  String age = "";
  String gender = "";
  String city = "";
  String profileImageUrl = "";
  String finalImageUrl = "";
  bool userBlock = false;

  @override
  void initState() {
    isLoading = true;
    () async {
      await getProfileData();
      setState(() {
        isLoading = false;
        // Update your UI with the desired changes.
      });
    }();
    super.initState();
  }

  getProfileData() async {
    accessToken = Constants.userData.accesstoken;
    print(accessToken);
    print("trying to get profile data");
    await AuthService().getAuthProfileData(accessToken, userName).then((val) {
      if (val.data['success']) {
        setState(() {
          print(val.data['user']['username']);
          profileImageUrl = val.data['user']['profileImageUrl'];

          finalImageUrl =
              "https://zyestabackendcloud.s3.us-east-2.amazonaws.com/$profileImageUrl" +
                  '#' +
                  Random().nextInt(100000000).toString();
          userBlock = val.data['blocked'];
          print(userBlock);
          userId = val.data['user']['userId'];
          about = val.data['user']['about'];
          interests = val.data['user']['interests'];
          jobTitle = val.data['user']['job_role'];
          company = val.data['user']['company'];
          university = val.data['user']['university'];
          firstName = val.data['user']['firstName'];
          lastName = val.data['user']['lastName'];
          age = (val.data['user']['age']).toString();
          gender = val.data['user']['gender'];
          city = val.data['user']['city'];
        });
      }
    });
  }

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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(firstName + " " + lastName),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppTheme.buttoncolorgradient,
            ),
          ),
          actions: [
            menuOptions(context, userBlock),
          ],
        ),
        body: Container(
          width: 100.w,
          decoration: BoxDecoration(
            gradient: AppTheme.backgroundcolorgradient,
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: 10.w, left: 10.w, top: 8.h),
                      child: Column(
                        children: [
                          Details(
                            about: about,
                            interests: interests,
                            jobTitle: jobTitle,
                            company: company,
                            university: university,
                            firstName: firstName,
                            lastName: lastName,
                            age: age,
                            gender: gender,
                            city: city,
                          ),
                          userBlock
                              ? Container()
                              : OtherProfileButton(
                                  text: "Send Request",
                                ),
                          SizedBox(
                            height: (1.5).h,
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     final _formKey = GlobalKey<FormState>();
                          //     TextEditingController _chat =
                          //         TextEditingController();
                          //     final requiredValidator = RequiredValidator(
                          //         errorText: 'This field is required');
                          //     Alert(
                          //         context: context,
                          //         title: "Super Chat",
                          //         style: AlertStyle(titleStyle: profileHeading),
                          //         content: Form(
                          //           key: _formKey,
                          //           child: TextFormField(
                          //             autovalidateMode:
                          //                 AutovalidateMode.onUserInteraction,
                          //             keyboardType: TextInputType.text,
                          //             textAlignVertical:
                          //                 TextAlignVertical.bottom,
                          //             controller: _chat,
                          //             validator: requiredValidator,
                          //             maxLines: 7,
                          //             decoration: InputDecoration(
                          //               enabledBorder: OutlineInputBorder(
                          //                 borderSide: const BorderSide(
                          //                     color: Color(0xFFA171BD),
                          //                     width: 2.0),
                          //                 borderRadius:
                          //                     BorderRadius.circular(25.0),
                          //               ),
                          //               focusedErrorBorder: OutlineInputBorder(
                          //                 borderSide: const BorderSide(
                          //                     color: Color(0xFFA171BD),
                          //                     width: 2.0),
                          //                 borderRadius:
                          //                     BorderRadius.circular(25.0),
                          //               ),
                          //               focusedBorder: OutlineInputBorder(
                          //                 borderSide: const BorderSide(
                          //                     color: Color(0xFFA171BD),
                          //                     width: 2.0),
                          //                 borderRadius:
                          //                     BorderRadius.circular(25.0),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         buttons: [
                          //           DialogButton(
                          //             onPressed: () async {
                          //               if (_formKey.currentState!
                          //                   .validate()) {}
                          //             },
                          //             radius:
                          //                 BorderRadius.all(Radius.circular(30)),
                          //             gradient: AppTheme.buttonGradient,
                          //             child: Text(
                          //               "Submit",
                          //               style: TextStyle(
                          //                   color: Colors.white, fontSize: 20),
                          //             ),
                          //           ),
                          //           DialogButton(
                          //             onPressed: () async {},
                          //             border: const Border.fromBorderSide(
                          //                 BorderSide(
                          //                     color: const Color(0xFF7819AD),
                          //                     width: 2,
                          //                     style: BorderStyle.solid)),
                          //             radius:
                          //                 BorderRadius.all(Radius.circular(30)),
                          //             color: Colors.white,
                          //             child: Text(
                          //               "Cancel",
                          //               style: TextStyle(
                          //                   color: Color(0xFF7819AD),
                          //                   fontSize: 20),
                          //             ),
                          //           )
                          //         ]).show();
                          //   },
                          //   child: OtherProfileButton(
                          //     text: "Send SuperChat",
                          //   ),
                          // ),
                          SizedBox(
                            height: 2.h,
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

  //Pop Up menu
  Theme menuOptions(BuildContext context, userBlock) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme().apply(bodyColor: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      child: PopupMenuButton<int>(
        color: Colors.white,
        itemBuilder: (context) => [
          PopupMenuItem<int>(
            value: 0,
            child: Text(
              "Report User",
              style: AppTheme.kHeadingTextStyle,
            ),
          ),
          PopupMenuItem<int>(
            value: 1,
            child: Text(
              userBlock ? "Unblock User" : "Block User",
              style: AppTheme.kHeadingTextStyle,
            ),
          ),
        ],
        onSelected: (item) => selectedItem(context, item, userBlock),
      ),
    );
  }

  //Selected Pop Up Menu
  void selectedItem(BuildContext context, item, userBlock) {
    switch (item) {
      case 0:
        final _formKey = GlobalKey<FormState>();
        TextEditingController _report =
        TextEditingController();
        final requiredValidator = RequiredValidator(
            errorText: 'This field is required');
        Alert(
            context: context,
            title: "Report User",
            style: AlertStyle(titleStyle: profileHeading),
            content: Form(
              key: _formKey,
              child: TextFormField(
                autovalidateMode:
                AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text,
                textAlignVertical:
                TextAlignVertical.bottom,
                controller: _report,
                validator: requiredValidator,
                maxLines: 7,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xFFA171BD),
                        width: 2.0),
                    borderRadius:
                    BorderRadius.circular(25.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xFFA171BD),
                        width: 2.0),
                    borderRadius:
                    BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xFFA171BD),
                        width: 2.0),
                    borderRadius:
                    BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            buttons: [
              DialogButton(
                onPressed: () async {
                  if (_formKey.currentState!
                      .validate()) {
                    Navigator.of(context, rootNavigator: true).pop();
                    loading();
                    await UserService().reportUser(accessToken, userId, _report.text);
                    loading();
                  }
                },
                radius:
                BorderRadius.all(Radius.circular(30)),
                gradient: AppTheme.buttonGradient,
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20),
                ),
              ),
              DialogButton(
                onPressed: () async {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                border: const Border.fromBorderSide(
                    BorderSide(
                        color: const Color(0xFF7819AD),
                        width: 2,
                        style: BorderStyle.solid)),
                radius:
                BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Color(0xFF7819AD),
                      fontSize: 20),
                ),
              )
            ]).show();
        break;
      case 1:
        print("Block user clicked");
        Alert(
            context: context,
            title: userBlock ? "Unblock User ?" : "Block User ?",
            style: AlertStyle(titleStyle: AppTheme.kHeadingTextStyle),
            buttons: [
              DialogButton(
                onPressed: () async {
                  Navigator.of(context, rootNavigator: true).pop();
                  loading();
                  userBlock
                      ? await UserService().unblockUser(accessToken, userId)
                      : await UserService().blockUser(accessToken, userId);
                  await getProfileData();
                  loading();
                },
                gradient: AppTheme.buttonGradient,
                child: Text(
                  "Yes",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]).show();
        break;
    }
  }
}
