import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/GoogleMap/mapScreen.dart';
import 'package:zyesta_app/screens/model/EventDataModel.dart';
import 'package:zyesta_app/screens/profile/profile_screen.dart';
import 'package:zyesta_app/utils/const.dart';

class EventApprovedCard extends StatelessWidget {
  final EventData? eventData;
  final Function callback;
  const EventApprovedCard({Key? key, this.eventData, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double height = size.height / 2.15;
    double width = size.width;
    return Container(
      width: width,
      decoration: AppTheme.cardDecoration,
      margin: EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FadeInImage(
                // image: NetworkImage(Constants.userData.profileImageUrl!),
                image: NetworkImage(Constants.baseImageURL + eventData!.imageUrl!),

                placeholder: AssetImage('assets/images/homepage/imageLoader.gif'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/homepage/card.png',
                    fit: BoxFit.cover,
                    height: height / 1.7,
                    width: double.infinity,
                  );
                },
                fit: BoxFit.cover,
                height: height / 1.7,
                width: double.infinity,
              ),
              Container(
                  width: width,
                  margin: EdgeInsets.symmetric(
                      horizontal: height / 20, vertical: height / 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(eventData!.name!,
                          style: AppTheme.heading(height / 20)),
                      SizedBox(
                        height: height / 50,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: height / 30,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: width / 30,
                          ),
                          Expanded(
                            child: Text(
                              eventData!.date!,
                              style: TextStyle(
                                fontSize: height / 35,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: height / 30,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: width / 30,
                          ),
                          Expanded(
                            child: Text(
                              eventData!.location!,
                              style: TextStyle(
                                fontSize: height / 35,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: height / 30,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: width / 30,
                          ),
                          Expanded(
                            child: Text(
                              '540 members are going to this event',
                              style: TextStyle(
                                fontSize: height / 35,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text('About Event', style: AppTheme.heading(height / 23)),
                      SizedBox(
                        height: height / 50,
                      ),
                      Text(
                        eventData!.about!,
                        style: TextStyle(
                            fontSize: height / 30,
                            color: AppTheme.darkColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Text(
                        'Host',
                        style: TextStyle(
                            fontSize: height / 23,
                            color: AppTheme.darkColor,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ProfileScreen.id);
                                },
                                child: Container(
                                  width: AppBar().preferredSize.height / 1.1,
                                  height: AppBar().preferredSize.height / 1.1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        AppBar().preferredSize.height / 1.2),
                                    child: FadeInImage(
                                      // image: NetworkImage(Constants.userData.profileImageUrl!),
                                      image: NetworkImage(
                                          'https://picsum.photos/250?image=9'),

                                      placeholder: FileImage(
                                          File(Constants.noProfileUrl)),
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.file(
                                            File(Constants.noProfileUrl),
                                            fit: BoxFit.cover);
                                      },
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                              'Sony Music',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppTheme.darkColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 2,
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: ShaderMask(
                              shaderCallback: (Rect bound) {
                                return AppTheme.buttonGradient
                                    .createShader(bound);
                              },
                              child: Text(
                                "REQUEST ACCEPTED!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 2,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: height / 15,
                      ),
                      Text('Event Details',
                          style: AppTheme.heading(height / 23)),
                      SizedBox(
                        height: height / 15,
                      ),
                      Container(
                          height: height / 2,
                          decoration: AppTheme.cardDecoration,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(height / 25),
                            child: MapScreen(),
                          )),
                      SizedBox(
                        height: height / 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: height / 30,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: width / 30,
                          ),
                          Expanded(
                            child: Text(
                              '12/41 C, 3rd Cross, Andheri, Mumbai',
                              style: TextStyle(
                                fontSize: height / 35,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 15,
                      ),
                      Text('Start Your Preps!',
                          style: AppTheme.heading(height / 23)),
                      SizedBox(
                        height: height / 30,
                      ),
                      Text(
                        'Bring Your Own Booze if you want to',
                        style: TextStyle(
                            fontSize: height / 30,
                            color: AppTheme.darkColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      Text(
                        'Bring Your Own Booze if you want to',
                        style: TextStyle(
                            fontSize: height / 30,
                            color: AppTheme.darkColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      Text(
                        'Bring Your Own Booze if you want to',
                        style: TextStyle(
                            fontSize: height / 30,
                            color: AppTheme.darkColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      Text(
                        'Bring Your Own Booze if you want to',
                        style: TextStyle(
                            fontSize: height / 30,
                            color: AppTheme.darkColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: height / 15,
                      ),
                      Text('Contact ', style: AppTheme.heading(height / 23)),
                      SizedBox(
                        height: height / 30,
                      ),
                      Text(
                        'In case of any necessity, contact me on...',
                        style: TextStyle(
                            fontSize: height / 30,
                            color: AppTheme.darkColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      Text(
                        'Email Id : priyankakhan@gmail.com',
                        style: TextStyle(
                            fontSize: height / 30,
                            color: AppTheme.darkColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      Text(
                        'Phone : +919876543210',
                        style: TextStyle(
                            fontSize: height / 30,
                            color: AppTheme.darkColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
            ]),
      ),
    );
  }
}
