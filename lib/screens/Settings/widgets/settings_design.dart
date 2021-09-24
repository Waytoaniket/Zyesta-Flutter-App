import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:sizer/sizer.dart';

final boxPadding = EdgeInsets.only(top: 4.w,right: 4.w,left: 5.w,bottom: 2.w);
final boxSettingDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(20)),
  boxShadow: <BoxShadow>[
    BoxShadow(
        color: Colors.grey.shade300,
        blurRadius: 15.0,
        offset: Offset(0.0, 0.75)
    )
  ],
);

final settingHeading = AppTheme.kHeadingTextStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 12.sp);

final subHeading = AppTheme.kHeadingTextStyle.copyWith(fontWeight: FontWeight.w500,fontSize: 10.sp);