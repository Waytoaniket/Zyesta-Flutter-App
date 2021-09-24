import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/screens/Notifications/widget/appbar.dart';
import 'package:zyesta_app/screens/Notifications/widget/notificationTile.dart';

import '../../app_theme.dart';

class SideDrawer extends StatefulWidget {
  SideDrawer({Key? key}) : super(key: key);

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: AppTheme.nearlyWhite,
      width: size.width * .9,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            drawerAppBar(context, "Notification"),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    NotificationTile(),
                    NotificationTile(),
                    NotificationTile(),
                    NotificationTile(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
