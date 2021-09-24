import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';

Widget chatBubble(Size size, bool sendByMe) {
  BoxDecoration boxdecor = sendByMe
      ? BoxDecoration(
          color: Color.fromRGBO(222, 155, 255, 1),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(12)),
        )
      : BoxDecoration(
          color: AppTheme.nearlyWhite,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(12)),
        );
  return Align(
    alignment: sendByMe ? Alignment.topRight : Alignment.topLeft,
    child: Container(
      padding: EdgeInsets.all(size.width * .02),
      margin: EdgeInsets.all(size.width * .02),
      decoration: boxdecor,
      width: size.width * .7,
      child: Text(
          'Excepteura eExcepteura eExcepteura eExcepteura eExcepteura eExcepteura eExcepteura eExcepteura eExcepteura eExcepteura e'),
    ),
  );
}
