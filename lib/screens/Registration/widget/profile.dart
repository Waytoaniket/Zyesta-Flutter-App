import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getProfile(size, profileImage, Function getImage) {
  return Padding(
    padding: EdgeInsets.only(top: size.width / 8),
    child: Center(
      child: Stack(
        children: [
          Container(
            height: size.width / 2.2,
            width: size.width / 2.2,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: FileImage(File(profileImage)), fit: BoxFit.cover)),
          ),
          Positioned(
            right: size.width / 50,
            bottom: size.width / 50,
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {
                getImage();
              },
              child: Container(
                height: size.width / 9,
                width: size.width / 9,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 122, 25, 173),
                ),
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
