import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/utils/const.dart';

class RequestTile extends StatelessWidget {
  const RequestTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          right: size.width * .04,
          left: size.width * .04,
          top: size.width * .01),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: size.width * .04),
                width: size.width * .125,
                height: size.width * .125,
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
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'William Anderson wants to message you!',
                        style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: size.height * .017,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: size.height * .005,
                      ),
                      Text(
                        'Hey...Are you interested to visit the museum?',
                        style: TextStyle(
                          color: AppTheme.darkColor,
                          fontSize: size.height * .014,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * .04,
                  width: size.height * .04,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * .04,
                  width: size.height * .04,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.redAccent[700]),
                  child: Icon(
                    Icons.close_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: size.width * .14,
              top: size.width * .01,
            ),
            child: Divider(
              thickness: 1.2,
            ),
          )
        ],
      ),
    );
  }
}
