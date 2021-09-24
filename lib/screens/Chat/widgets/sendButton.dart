
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/screens/Chat/widgets/meet_dialog.dart';

import '../../../app_theme.dart';

Widget sendButton(context, Size size, bool enableSend) {
  return InkWell(
    onTap: () {
      enableSend ? print("sendButton Pressed") : meetDialog(context, size);
    },
    child: Container(
      height: size.width * .115,
      width: size.width * .115,
      decoration: BoxDecoration(
          gradient: AppTheme.buttonGradient, shape: BoxShape.circle),
      child: Center(
        child: enableSend
            ? Icon(Icons.send, color: Colors.white)
            : ImageIcon(
                AssetImage('assets/images/chat/meet.png'),
                color: Colors.white,
                size: size.width * .06,
              ),
      ),
    ),
  );
}