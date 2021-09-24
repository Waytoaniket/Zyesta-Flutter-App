import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_theme.dart';

Widget addressbar(Size size) {
  return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: AppTheme.primaryColor,
            size: size.width / 18,
          ),
          Text(
            "23rd Street, Cross road, Mumbai",
            style: TextStyle(
                fontSize: size.width / 28,
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w500),
          ),
          Icon(
            Icons.keyboard_arrow_down_sharp,
            color: AppTheme.primaryColor,
            size: size.width / 15,
          ),
        ],
      ));
}
