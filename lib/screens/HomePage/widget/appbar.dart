import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/screens/OtherProfile/otherProfile.dart';
import 'package:zyesta_app/screens/QRscreen/qr_screen.dart';
import 'package:zyesta_app/screens/profile/profile_screen.dart';
import 'package:zyesta_app/utils/const.dart';
import 'package:zyesta_app/app_theme.dart';

Widget homeAppBar(context, Function callback) {
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
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Container(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(
                              callback: callback,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Container(
                          width: AppBar().preferredSize.height / 1.2,
                          height: AppBar().preferredSize.height / 1.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                AppBar().preferredSize.height / 1.2),
                            child: FadeInImage(
                              // image: NetworkImage(Constants.userData.profileImageUrl!),
                              image: NetworkImage(Constants.baseImageURL +
                                  Constants.userData.profileImageUrl!),
                              placeholder: AssetImage(
                                  'assets/images/homepage/imageLoader.gif'),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                    'assets/images/registration/noprofile.png',
                                    fit: BoxFit.cover);
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    'Hello, ${Constants.userData.username}!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                child: Material(
                  color: AppTheme.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: AppBar().preferredSize.height / 1.5,
                      height: AppBar().preferredSize.height / 1.5,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryColor,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/homepage/crown.png",
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: AppBar().preferredSize.height / 1.3,
                      height: AppBar().preferredSize.height / 1.3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, QRScreen.id);
                        },
                        child: Icon(
                          Icons.qr_code_2_outlined,
                          color: Colors.white,
                          size: AppBar().preferredSize.height / 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Container(
                      width: AppBar().preferredSize.height / 1.5,
                      height: AppBar().preferredSize.height / 1.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: AppBar().preferredSize.height / 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
