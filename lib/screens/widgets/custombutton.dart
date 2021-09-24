import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';


class CustomButton extends StatelessWidget {
  final bool isColor;
  final String text;
  final double textSize;
  final double height;
  final double width;
  final Function onPressed;
  const CustomButton(
      {Key? key,
      this.isColor = true,
      required this.text,
      required this.textSize,
      required this.height,
      required this.width,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width),
          gradient: isColor
              ? AppTheme.buttonGradient
              : LinearGradient(
                  colors: [Colors.white, Colors.white]),
          boxShadow: [
             isColor ? BoxShadow(
              color: AppTheme.primaryColor,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ):BoxShadow(
              color: AppTheme.primaryColor,
              offset: Offset(0.0, 0.0), //(x,y)
              blurRadius: 1.0,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isColor ? Colors.white : AppTheme.primaryColor,
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
