import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/Chat/chat_room.dart';
import 'package:zyesta_app/utils/const.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRoom(),
            ),
          );
        },
        child: Padding(
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
                    margin: EdgeInsets.only(right: size.width * .06),
                    width: size.width * .12,
                    height: size.width * .12,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        size.width * .12,
                      ),
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
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nida Chauhan',
                            style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontSize: size.height * .02,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: size.height * .005,
                          ),
                          Text(
                            'Hi..How are you?',
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
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      height: size.height * .03,
                      width: size.height * .03,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primaryColor1),
                      child: Text(
                        '2',
                        style: TextStyle(
                            color: AppTheme.nearlyWhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * .16,
                  top: size.width * .01,
                ),
                child: Divider(
                  thickness: 1.2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
