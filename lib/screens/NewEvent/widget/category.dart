import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_theme.dart';

Widget getCategoryUI(double height, double width, CategoryType categoryType,
    Function updateCategory) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        child: Text(
          'Gender Preference',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: width / 17,
            letterSpacing: 0.27,
            color: AppTheme.darkColor,
          ),
        ),
      ),
      SizedBox(
        height: width / 20,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        child: Row(
          children: <Widget>[
            getButtonUI(CategoryType.male, categoryType == CategoryType.male, updateCategory),
            SizedBox(
              width: width / 25,
            ),
            getButtonUI(
                CategoryType.female, categoryType == CategoryType.female, updateCategory),
            SizedBox(
              width: width / 25,
            ),
            getButtonUI(CategoryType.both, categoryType == CategoryType.both, updateCategory),
          ],
        ),
      ),
    ],
  );
}

Widget getButtonUI(
    CategoryType categoryTypeData, bool isSelected, Function updateCategory) {
  String txt = '';
  if (CategoryType.male == categoryTypeData) {
    txt = 'Male';
  } else if (CategoryType.female == categoryTypeData) {
    txt = 'Women';
  } else if (CategoryType.both == categoryTypeData) {
    txt = 'Both';
  }
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
          gradient: isSelected
              ? AppTheme.buttonGradient
              : LinearGradient(
                  colors: [Colors.transparent, Colors.transparent]),
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          border: Border.all(color: AppTheme.primaryColor)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white24,
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          onTap: () {
            updateCategory(categoryTypeData);
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
            child: Center(
              child: Text(
                txt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: 0.27,
                  color: isSelected ? Colors.white : AppTheme.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

enum CategoryType {
  male,
  female,
  both,
}
