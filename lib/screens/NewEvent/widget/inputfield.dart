import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../app_theme.dart';

final requiredValidator =
    RequiredValidator(errorText: 'This field is required');

Widget getInputField(
    double height, double width, String text, TextEditingController _controller,
    {bool isRounded = false}) {
  InputBorder underLineBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: AppTheme.primaryColor),
  );
  InputBorder roundedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(width / 30)),
    borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
  );
  InputBorder focusRoundedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(width / 32)),
    borderSide: BorderSide(
      color: AppTheme.primaryColor,
    ),
  );
  return Padding(
    padding: EdgeInsets.symmetric(vertical: height / 80),
    child: Container(
      height: height / 11,
      width: width,
      decoration: AppTheme.cardDecoration,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 28),
            child: Text(
              text,
              style:
                  AppTheme.darktextStyle(width / 22, weight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 35),
              child: TextFormField(
                controller: _controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: true,
                cursorColor: AppTheme.primaryColor,
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: width / 22,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: isRounded ? roundedBorder : underLineBorder,
                  focusedBorder:
                      isRounded ? focusRoundedBorder : underLineBorder,
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(width / 35),
                ),
                validator: requiredValidator,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget getMultiLineInputField(double height, double width, String text,
    TextEditingController _controller) {
  InputBorder underLineBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: AppTheme.primaryColor),
  );
  return Padding(
    padding: EdgeInsets.symmetric(vertical: height / 80),
    child: Container(
      // height: height / 5,
      padding: EdgeInsets.symmetric(vertical: height / 25),
      width: width,
      decoration: AppTheme.cardDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 28),
            child: Text(
              text,
              style:
                  AppTheme.darktextStyle(width / 22, weight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 35),
              child: TextFormField(
                controller: _controller,
                onChanged: (value) {},
                minLines: 2,
                maxLines: 5,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: true,
                cursorColor: AppTheme.primaryColor,
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: width / 22,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: underLineBorder,
                  focusedBorder: underLineBorder,
                  isDense: true, // Added this
                  // contentPadding: EdgeInsets.all(width / 45),
                ),
                validator: requiredValidator,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget getDropDownInput(
  double height,
  double width,
  String text,
  String? _selectedType,
  Function updateDropDownValue,
) {
  final List<String> _data = ['Club', 'PentHouse', 'Music Concert'];
  return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height / 80,
      ),
      child: Container(
        height: height / 11,
        width: width,
        decoration: AppTheme.cardDecoration,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 28),
              child: Text(
                text,
                style:
                    AppTheme.darktextStyle(width / 22, weight: FontWeight.w400),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width / 20),
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primaryColor, width: 2.0)),
              padding: EdgeInsets.all(width / 40.0),
              margin: EdgeInsets.only(right: width / 40),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppTheme.primaryColor,
                      size: width / 15,
                    ),
                    isDense: true, // Added this
                    items: _data.map((String val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(
                          val,
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: width / 22,
                          ),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      _selectedType ?? _data[0],
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: width / 22,
                      ),
                    ),
                    onChanged: (String? val) {
                      updateDropDownValue(val);
                    }),
              ),
            ))
          ],
        ),
      ));
}
