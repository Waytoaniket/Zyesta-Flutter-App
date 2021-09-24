import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/screens/NewEvent/hostEvent.dart';

import '../../../app_theme.dart';

Widget suffixIconButton(
  context,
  String text,
  double textSize,
  double height,
  double width,
  IconData suffixIcon,
  double iconSize,
) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, HostNewEvent.id);
    },
    child: Center(
      child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width),
            gradient: AppTheme.buttonGradient,
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                suffixIcon,
                color: Colors.white,
                size: iconSize,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: textSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )),
    ),
  );
}
