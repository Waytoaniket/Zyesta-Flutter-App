import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_theme.dart';

Widget getSearchCategoryUI(context, double height, double width,
    SearchCategoryType categoryType, Function updateCategory) {
  return Container(
    width: width * .9,
    padding: EdgeInsets.symmetric(vertical: height * .02),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 20, vertical: height * .01),
          child: Row(
            children: <Widget>[
              getButtonUI(context, SearchCategoryType.newest,
                  categoryType == SearchCategoryType.newest, updateCategory),
              SizedBox(
                width: width / 25,
              ),
              getButtonUI(context, SearchCategoryType.sort,
                  categoryType == SearchCategoryType.sort, updateCategory),
              SizedBox(
                width: width / 25,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 20, vertical: height * .01),
          child: Row(
            children: <Widget>[
              getButtonUI(context, SearchCategoryType.distance,
                  categoryType == SearchCategoryType.distance, updateCategory),
              SizedBox(
                width: width / 25,
              ),
              getButtonUI(context, SearchCategoryType.location,
                  categoryType == SearchCategoryType.location, updateCategory),
              SizedBox(
                width: width / 25,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget getButtonUI(context, SearchCategoryType categoryTypeData,
    bool isSelected, Function updateCategory) {
  String txt = '';
  if (SearchCategoryType.newest == categoryTypeData) {
    txt = 'Newest ';
  } else if (SearchCategoryType.sort == categoryTypeData) {
    txt = 'Sort by A-Z ';
  } else if (SearchCategoryType.distance == categoryTypeData) {
    txt = 'Distance';
  } else if (SearchCategoryType.location == categoryTypeData) {
    txt = 'Location';
  }
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        gradient: !isSelected
            ? AppTheme.buttonGradient
            : LinearGradient(colors: [Colors.transparent, Colors.transparent]),
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        border: Border.all(color: AppTheme.primaryColor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white24,
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          onTap: () {
            updateCategory(categoryTypeData);
            Navigator.of(context, rootNavigator: true).pop();
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
                  color: !isSelected ? Colors.white : AppTheme.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

enum SearchCategoryType { newest, sort, distance, location }
