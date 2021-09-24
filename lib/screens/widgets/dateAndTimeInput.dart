import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../app_theme.dart';

class DateTimeInputField extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController controller;
  final Function callback;
  final suffixIcon;
  DateTimeInputField(
      {Key? key,
      required this.callback,
      required this.controller,
      required this.hintText,
      required this.text,
      required this.suffixIcon})
      : super(key: key);

  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    InputBorder roundedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(size.width / 30)),
      borderSide: BorderSide(color: AppTheme.primaryColor, width: 1),
    );
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: size.width / 22,
                fontWeight: FontWeight.w400,
                color: AppTheme.primaryColor),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.0,
            ),
            child: Container(
              width: size.width * .45,
              child: InkWell(
                onTap: () {
                  callback();
                },
                child: IgnorePointer(
                  child: TextFormField(
                    
                    controller: controller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autocorrect: true,
                    cursorColor: AppTheme.primaryColor,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: size.width / 26,
                        letterSpacing: 1.5),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: roundedBorder,
                      focusedBorder: roundedBorder,
                      border: roundedBorder,
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.only(left: size.width / 25),
                      helperText: "",
                      helperStyle: TextStyle(height: 0.5),
                      errorStyle: TextStyle(height: 0.5),
                      suffixIcon: suffixIcon,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    validator: requiredValidator,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
