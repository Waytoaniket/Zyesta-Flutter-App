import 'package:flutter/material.dart';

import 'package:zyesta_app/app_theme.dart';

AppBar blockedAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    title: Text("Blocked Users"),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: AppTheme.buttoncolorgradient,
      ),
    ),
  );
}