import 'package:flutter/material.dart';

const textInputdecoration = InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  contentPadding: EdgeInsets.only(left: 15, top: 17, right: 15),
  hintStyle: TextStyle(
    color: Color(0xFF7819AD),
  ),
);

const inputBoxdecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  color: Colors.white,
);

Widget getEmailField(context,TextEditingController email){
  final node = FocusScope.of(context);
  return Container(
    padding: EdgeInsets.all(5),
    decoration: inputBoxdecoration,
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: (value) {},
      onEditingComplete: () => node.nextFocus(),
      style: TextStyle(
        color: Color(
            0xFF7819AD), //TextFormField title background color change
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: textInputdecoration.copyWith(
        hintText: "Enter Email or Username",
        prefixIcon: Icon(
          Icons.email,
          color: Color(0xFF7819AD),
        ),
      ),
      controller: email,
    ),
  );
}

Widget getPasswordField(context,TextEditingController password,bool _passwordVisible,Function passwordVisibility){
  final node = FocusScope.of(context);

  return Container(
    padding: EdgeInsets.all(5),
    decoration: inputBoxdecoration,
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: (value) {},
      onEditingComplete: () => node.nextFocus(),
      style: TextStyle(
        color: Color(
            0xFF7819AD), //TextFormField title background color change
      ),
      obscureText: !_passwordVisible,
      keyboardType: TextInputType.emailAddress,
      decoration: textInputdecoration.copyWith(
        hintText: "Enter password",
        prefixIcon: Icon(
          Icons.lock,
          color: Color(0xFF7819AD),
        ),
        suffixIcon: GestureDetector(
          onLongPress: () {
            passwordVisibility();
          },
          onLongPressUp: () {
            passwordVisibility();
          },
          child: Icon(
            _passwordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Color(0xFF7819AD),
          ),
        ),
      ),
      controller: password,
    ),
  );
}