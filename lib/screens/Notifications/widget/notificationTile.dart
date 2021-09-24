import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/utils/const.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .09,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Material(
        child: InkWell(
          
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * .01, horizontal: size.width * .022),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: size.width * .03),
                  width: size.width * .13,
                  height: size.width * .13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      size.width * .15,
                    ),
                    child: FadeInImage(
                      // image: NetworkImage(Constants.userData.profileImageUrl!),
                      image: NetworkImage(Constants.baseImageURL +
                          Constants.userData.profileImageUrl!),
                      placeholder:
                          AssetImage('assets/images/homepage/imageLoader.gif'),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                            'assets/images/registration/noprofile.png',
                            fit: BoxFit.cover);
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You have 5 pending requests!',
                        style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: size.height * .017,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * .005,
                      ),
                      Text(
                        'Venue: Mitron Bandra',
                        style: TextStyle(
                            color: AppTheme.darkColor,
                            fontSize: size.height * .014,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '8 mins ago',
                    style: TextStyle(
                        fontSize: size.height * .014,
                        color: AppTheme.primaryColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
