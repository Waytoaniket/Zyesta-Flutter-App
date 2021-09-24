import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/app_theme.dart';

class EditProfileWidget extends StatelessWidget {

  final IconData icon;

  EditProfileWidget({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.w / 9,
      width: 100.w / 9,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppTheme.buttoncolorgradient,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class editProfileIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.w / 20,
      width: 100.w / 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppTheme.buttoncolorgradient,
      ),
      child: Icon(
        Icons.edit,
        color: Colors.white,
        size: 100.w / 35,
      ),
    );
  }
}

final boxProfileDecoration = BoxDecoration(
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

final profileHeading = AppTheme.kHeadingTextStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 12.sp);

final subHeading = AppTheme.kHeadingTextStyle.copyWith(fontWeight: FontWeight.w600,fontSize: 11.sp
);

final contentHeading = AppTheme.kHeadingTextStyle.copyWith(fontSize: 10.sp);

const profileInputDecoration = InputDecoration(
  counterText: "",
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF7819AD)),
  ),
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  hintStyle: TextStyle(
    color: Color(0xFF7819AD),
  ),
);

final boxPadding = EdgeInsets.only(top: 4.w,right: 4.w,left: 5.w,bottom: 2.w);