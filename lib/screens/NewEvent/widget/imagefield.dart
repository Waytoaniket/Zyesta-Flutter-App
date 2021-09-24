import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';

Widget showImage(File _image,double height, double width, Function discardImage) {
  return Center(
    child: Column(
      children: <Widget>[
        Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SizedBox(
               child: Image.file(_image, fit: BoxFit.fitHeight)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width/25.0),
          ),
          elevation: 10,
          margin: EdgeInsets.symmetric(vertical:width/25),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: Ink(
            decoration: ShapeDecoration(
              color: AppTheme.primaryColor,
              shape: CircleBorder(),
            ),
            child: IconButton(
                tooltip: 'Discard',
                color: Colors.white,
                icon: Icon(Icons.close),
                onPressed: () => {
                  discardImage()
                      
                    }),
          ),
        )
      ],
    ),
  );
}
