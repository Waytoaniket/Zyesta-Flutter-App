import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/utils/const.dart';

import '../../../../app_theme.dart';

Widget chatRoomAppbar(context, String title) {
  return Container(
    decoration: new BoxDecoration(
      gradient: AppTheme.appBarGradient,
      boxShadow: [
        BoxShadow(
          color: AppTheme.primaryColor,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 6.0,
        ),
      ],
    ),
    height: AppBar().preferredSize.height * 1.2,
    child: Padding(
      padding: EdgeInsets.only(
        top: 0,
        left: 8,
        right: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            width: AppBar().preferredSize.height * .7,
            height: AppBar().preferredSize.height,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            width: AppBar().preferredSize.height / 1.3,
            height: AppBar().preferredSize.height / 1.3,
            margin: EdgeInsets.only(
                right: AppBar().preferredSize.height * .2,
                left: AppBar().preferredSize.height * .1),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(AppBar().preferredSize.height / 1.2),
              child: FadeInImage(
                // image: NetworkImage(Constants.userData.profileImageUrl!),
                image: NetworkImage(Constants.baseImageURL +
                    Constants.userData.profileImageUrl!),
                placeholder:
                    AssetImage('assets/images/homepage/imageLoader.gif'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/registration/noprofile.png',
                      fit: BoxFit.cover);
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: AppBar().preferredSize.height / 1.8,
            ),
          ),
        ],
      ),
    ),
  );
}
