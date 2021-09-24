import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/screens/widgets/custombutton.dart';

import '../../../app_theme.dart';

Widget searchbar(context, Size size, Function venueButtonclick,
    Function intrestButtonclick) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ShaderMask(
          shaderCallback: (Rect bound) {
            return AppTheme.buttonGradient.createShader(bound);
          },
          child: Text(
            'Search By',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        CustomButton(
            text: "Venues",
            textSize: 18,
            height: size.width / 9,
            width: size.width / 3.5,
            onPressed: venueButtonclick),
        CustomButton(
            text: "Interests",
            textSize: 18,
            height: size.width / 9,
            width: size.width / 3.5,
            onPressed: intrestButtonclick)
      ],
    ),
  );
}
