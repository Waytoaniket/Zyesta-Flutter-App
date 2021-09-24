import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/SearchByVenueAndIntrest/widget/searchCategory.dart';

Widget searchBar(
    Size size,
    context,
    String hintText,
    IconData icon,
    TextEditingController cont,
    TextInputType textinput,
    SearchCategoryType searchCategoryType,
    Function updateSearchCategory) {

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 2),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(size.width),
      border: Border.all(color: AppTheme.primaryColor),
      boxShadow: [
        BoxShadow(
          color: AppTheme.primaryColor.withOpacity(0.6),
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 6.0,
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            keyboardType: textinput,
            textAlignVertical: TextAlignVertical.bottom,
            controller: cont,
            cursorColor: AppTheme.primaryColor,
            style: TextStyle(color: Colors.black, fontSize: 20),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 20, right: 15),
                child: Icon(
                  icon,
                  color: AppTheme.primaryColor,
                  size: 35,
                ),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[700], fontSize: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(size.width),
                  borderSide: BorderSide.none),
              filled: true,
              contentPadding: EdgeInsets.only(left: 16, bottom: 16, top: 16),
              fillColor: Colors.white,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            filter(context, searchCategoryType, updateSearchCategory);
          },
          child: Padding(
            padding: EdgeInsets.only(right: 15),
            child: ImageIcon(
              AssetImage("assets/images/SearchByVenueIntrest/filter.png"),
              color: AppTheme.primaryColor,
              size: size.width*.07,
            ),
          ),
        ),
      ],
    ),
  );
}

void filter(context, SearchCategoryType searchCategoryType,
    Function updateSearchCategory) {
  final Size size = MediaQuery.of(context).size;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: <Widget>[
          Align(
              alignment: Alignment(0.0, -0.5),
              child: getSearchCategoryUI(context, size.height, size.width,
                  searchCategoryType, updateSearchCategory))
        ],
      );
    },
  );
}
