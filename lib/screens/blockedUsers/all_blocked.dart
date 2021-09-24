import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zyesta_app/screens/Settings/widgets/settings_design.dart';
import 'package:zyesta_app/screens/blockedUsers/widgets/blockedUserBar.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/app_theme.dart';

class AllBlockedUsers extends StatefulWidget {
  static const String id = 'all_blocked';

  @override
  _AllBlockedUsersState createState() => _AllBlockedUsersState();
}

class _AllBlockedUsersState extends State<AllBlockedUsers> {
  Dio dio = new Dio();

  Future<List<User>> _getUsers() async {
    Response response = await dio.get(
      'http://www.json-generator.com/api/json/get/bVvtmIfNMy?indent=2',
    );
    var allUsers = response.data['user'];
    List<User> users = [];
    for (var i in allUsers) {
      User user = User(
          i["userId"], i["firstname"], i["lastname"], i["profileImageUrl"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: blockedAppBar(context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 2.h,),
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (snapshot.data == null) {
                return Container(child: Center(child: Text("Loading...")));
              } else {
                return Container(
                  padding: EdgeInsets.all(2.w),
                  width: 90.w,
                  decoration: boxSettingDecoration,
                  child: ListView.builder(
                    shrinkWrap: true,
                    addRepaintBoundaries: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          index!=0 ? Divider(color: Colors.purple,thickness: 0.25.w,indent: 5.w,endIndent: 5.w,): Container(),
                          ListTile(
                            leading: Container(
                                height: 100.w / 8,
                                width: 100.w / 8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 2, color: Colors.white),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 3.0,
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: FadeInImage(
                                    image: NetworkImage("https://zyestabackendcloud.s3.us-east-2.amazonaws.com/${snapshot.data[index].profileImageUrl}" +
                                        '#' +
                                        Random().nextInt(100000000).toString()),
                                    placeholder: AssetImage(
                                        "assets/images/registration/loading.gif"),
                                    imageErrorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/images/registration/noprofileround.jpg',
                                          fit: BoxFit.fitWidth);
                                    },
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                            ),
                            title: Text(snapshot.data[index].firstName+" "+snapshot.data[index].lastName,style: subHeading,),
                            trailing: DialogButton(
                              radius:BorderRadius.all(Radius.circular(30)),
                              width: 20.w,
                              height: 4.h,
                              onPressed: () async {
                              },
                              gradient: AppTheme.buttonGradient,
                              child: Text(
                                "Unblock",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                fontWeight: FontWeight.w500),
                              ),
                            ),
                            onTap: () {

                            },
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class User {
  final String userId;
  final String firstName;
  final String lastName;
  final String profileImageUrl;
  User(this.userId, this.firstName, this.lastName, this.profileImageUrl);
}
