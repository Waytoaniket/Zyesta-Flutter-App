import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zyesta_app/screens/Settings/widgets/settings_design.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/Settings/widgets/field.dart';

class Subscription extends StatelessWidget {
  const Subscription({
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
          Text("Subscription", style: settingHeading),
          SizedBox(
            height: 1.h,
          ),
          GestureDetector(
            onTap: () {},
            child: Field(icon: FontAwesomeIcons.idBadge,fieldHeading: "Current Plan Details",),
          ),
          GestureDetector(
            onTap: () {},
            child: Field(icon: FontAwesomeIcons.shoppingBasket,fieldHeading: "Upgrade Subscription",)
          ),
          GestureDetector(
            onTap: () {},
            child: Field(icon: FontAwesomeIcons.timesCircle,fieldHeading: "Cancel Subscription",)
          ),
        ],
      ),
    );
  }
}

