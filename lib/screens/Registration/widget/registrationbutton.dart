import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zyesta_app/screens/HomePage/homescreen.dart';
import 'package:zyesta_app/screens/model/userdatamodel.dart';
import 'package:zyesta_app/services/api.dart';

import '../../../app_theme.dart';

Widget registrationButton(
    context,
    Size size,
    _formKey,
    TextEditingController _userName,
    TextEditingController _firstName,
    TextEditingController _lastName,
    TextEditingController _email,
    TextEditingController _password,
    TextEditingController _age,
    TextEditingController _gender,
    TextEditingController _mobileNumber,
    TextEditingController _city,
    String profileImage,
    Function updateIndicator,
    Function setProfilePic,
    Function updateUserData) {
  return InkWell(
    splashColor: Theme.of(context).primaryColorLight,
    onTap: () {
      print("validate");

      if (_formKey.currentState!.validate()) {
        updateIndicator();
        File imageFile = new File(profileImage);
    
        var data = UserDataModel(
                username: _userName.text,
                firstName: _firstName.text,
                lastName: _lastName.text,
                email: _email.text,
                password: _password.text,
                age: int.parse(_age.text),
                gender: _gender.text,
                mobile: _mobileNumber.text,
                city: _city.text,
                profileImageUrl: imageFile.path
                )
            .toJson();
        ApiProvider().registerUser(data,imageFile, updateUserData).then((response) {
          print(response);
          if (response != null && response['success']) {
            print(response);
            Fluttertoast.showToast(
                msg: response['message'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => HomeScreen()));
            print("Account Created Sucessfull");
          } else {
            Fluttertoast.showToast(
                msg: response['message'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1);
            // _firstName.clear();
            // _lastName.clear();
            // _userName.clear();
            // _email.clear();
            // _password.clear();
            // _confirmPassword.clear();
            // _age.clear();
            // _gender.clear();
            // _mobileNumber.clear();
            // _city.clear();
            setProfilePic();

            print("Login Failed");
            updateIndicator();
          }
        });
      }
    },
    child: Container(
        height: size.height / 15,
        width: size.width / 2.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width),
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
        child: Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )),
  );
}
