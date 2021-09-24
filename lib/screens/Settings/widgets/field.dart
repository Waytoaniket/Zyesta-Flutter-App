import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/Settings/widgets/settings_design.dart';

class Field extends StatelessWidget {
  const Field({
    required this.icon,
    required this.fieldHeading,
    Key? key,
  }) : super(key: key, );

  final IconData icon;
  final String fieldHeading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xFF7819AD),
            size: 4.w,
          ),
          SizedBox(width: 3.w,),
          Text(fieldHeading,
              style: subHeading),
        ],
      ),
    );
  }
}