import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/widgets/custombutton.dart';

Widget cardtitle(
    context, Size size, String header, bool special, onButtonclick) {
  return Container(
    margin: EdgeInsets.only(left: 20.0, right: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        !special
            ? Text(
                header,
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              )
            : ShaderMask(
                shaderCallback: (Rect bound) {
                  return AppTheme.buttonGradient.createShader(bound);
                },
                child: Text(
                  header,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
        CustomButton(
            text: "See All",
            textSize: 18,
            height: size.width / 11.5,
            width: size.width / 4,
            onPressed: onButtonclick),
      ],
    ),
  );
}
