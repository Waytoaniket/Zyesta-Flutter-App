import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zyesta_app/screens/Settings/widgets/settings_design.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/Settings/widgets/field.dart';
import 'package:zyesta_app/screens/blockedUsers/all_blocked.dart';

class BlockedUsers extends StatelessWidget {
  const BlockedUsers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: boxPadding,
      width: 80.w,
      decoration: boxSettingDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Users", style: settingHeading),
          SizedBox(
            height: 1.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context,AllBlockedUsers.id);
            },
            child: Field(
                icon: FontAwesomeIcons.ban,
                fieldHeading: "Blocked Users"),
          ),
        ],
      ),
    );
  }
}