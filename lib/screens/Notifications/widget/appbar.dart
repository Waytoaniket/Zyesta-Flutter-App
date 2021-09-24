import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_theme.dart';

Widget drawerAppBar(context, String title) {
  return Container(
    decoration: new BoxDecoration(
      gradient: AppTheme.appBarGradient,
      boxShadow: [
        BoxShadow(
          color: AppTheme.primaryColor,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 6.0,
        ),
      ],
    ),
    height: AppBar().preferredSize.height * 1.2,
    child: Padding(
      padding: EdgeInsets.only(
        top: 0,
        right: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: AppBar().preferredSize.height,
            height: AppBar().preferredSize.height,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
