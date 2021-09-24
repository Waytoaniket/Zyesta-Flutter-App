import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/HomePage/homescreen.dart';
import 'package:zyesta_app/screens/NewEvent/postEvent.dart';
import 'package:zyesta_app/screens/model/EventDataModel.dart';
import 'package:zyesta_app/screens/profile/profile_screen.dart';
import 'package:zyesta_app/screens/profile/widget/profile_widgets.dart';
import 'package:zyesta_app/screens/widgets/custombutton.dart';
import 'package:zyesta_app/services/api.dart';
import 'package:zyesta_app/utils/const.dart';

class EventDetailsCard extends StatefulWidget {
  final EventData? eventData;
  final Function callback;
  const EventDetailsCard({Key? key, this.eventData, required this.callback})
      : super(key: key);

  @override
  _EventDetailsCardState createState() => _EventDetailsCardState();
}

class _EventDetailsCardState extends State<EventDetailsCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double height = size.height / 2.15;
    double width = size.width;
    return Stack(
      children: [
        Container(
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
                  image: NetworkImage(
                      Constants.baseImageURL + widget.eventData!.imageUrl!),

                  placeholder:
                      AssetImage('assets/images/homepage/imageLoader.gif'),
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
                        Text(widget.eventData!.name!,
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
                                widget.eventData!.date!,
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
                                widget.eventData!.location!,
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
                        Text('About Event',
                            style: AppTheme.heading(height / 23)),
                        SizedBox(
                          height: height / 50,
                        ),
                        Text(
                          widget.eventData!.about!,
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
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(bottom: height / 15),
                  child: CustomButton(
                      text: 'View Attendees',
                      textSize: 20,
                      height: height / 8,
                      width: width / 1.8,
                      onPressed: widget.callback),
                )
              ],
            ),
          ),
        ),
        widget.eventData!.hostId == Constants.userData.userId
            ? Positioned(
                top: 30,
                right: 30,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostNewEvent(
                                      eventData: widget.eventData,
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: AppTheme.cardDecoration,
                        child: Icon(
                          Icons.edit,
                          color: AppTheme.primaryColor,
                          size: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    InkWell(
                      onTap: () {
                        deletePost(context);
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, HomeScreen.id, (route) => false);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: AppTheme.cardDecoration,
                        child: Icon(
                          Icons.delete,
                          color: AppTheme.primaryColor,
                          size: 25,
                        ),
                      ),
                    )
                  ],
                ))
            : Container()
      ],
    );
  }

  deletePost(context) {
    Alert(
      context: context,
      title: "Are you sure you want to remove this post?",
      style: AlertStyle(titleStyle: profileHeading),
      buttons: [
        DialogButton(
          onPressed: () async {
            ApiProvider().deletePost(
                {'eventId': widget.eventData!.eventId}).then((response) {
              if (response != null && response['success']) {
                Fluttertoast.showToast(
                    msg: response['message'],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1);
                Navigator.of(context, rootNavigator: true).pop();

                Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.id, (route) => false);
              } else {
                Fluttertoast.showToast(
                    msg: response['message'],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1);
                Navigator.of(context, rootNavigator: true).pop();
              }
            });
          },
          gradient: AppTheme.buttonGradient,
          child: Text(
            "Confirm Delete",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
