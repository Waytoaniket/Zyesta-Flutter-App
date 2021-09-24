import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/profile/profile_screen.dart';
import 'package:zyesta_app/screens/widgets/custombutton.dart';
import 'package:zyesta_app/utils/const.dart';

class AttendeeCard extends StatelessWidget {
  final String? name;
  final String? attendees;
  final String? place;
  final String? imagePath;
  final double? height;
  final double? width;
  final Function callback;
  const AttendeeCard(
      {Key? key,
      this.name,
      this.attendees,
      this.place,
      this.imagePath,
      this.height,
      this.width,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: AppTheme.cardDecoration,
      margin: EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Container(
            width: width,
            margin: EdgeInsets.symmetric(
                horizontal: height! / 20, vertical: height! / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(name!, style: AppTheme.heading(height! / 20))),
                SizedBox(
                  height: height! / 25,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: height! / 25, horizontal: height! / 50),
                  decoration: AppTheme.cardDecoration,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text('Apply Boost Up!',
                              style: TextStyle(
                                  fontSize: height! / 23,
                                  color: AppTheme.darkColor,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Container(
                        height: height! / 7,
                        width: width! / 3.5,
                        margin: EdgeInsets.symmetric(horizontal: height! / 50),
                        decoration: BoxDecoration(
                          gradient: AppTheme.buttonGradient,
                          borderRadius: BorderRadius.circular(height! / 10),
                        ),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(height! / 38),
                                child: Image.asset(
                                  'images/boost.png',
                                  fit: BoxFit.cover,
                                )),
                            Text(
                              'x 12',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 253, 241, 0),
                                  fontSize: height! / 22),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height! / 25,
                ),
                Text(
                  'Host',
                  style: TextStyle(
                      fontSize: height! / 23,
                      color: AppTheme.darkColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height! / 30,
                ),
                Row(
                  children: [
                    Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, ProfileScreen.id);
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

                                placeholder:
                                    FileImage(File(Constants.noProfileUrl)),
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
                  height: height! / 40,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        'Add me to the List',
                        style: TextStyle(
                          fontSize: height! / 25,
                          color: AppTheme.darkColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, ProfileScreen.id);
                          },
                          child: Container(
                            width: AppBar().preferredSize.height / 1.3,
                            height: AppBar().preferredSize.height / 1.3,
                            decoration: BoxDecoration(
                                gradient: AppTheme.buttonGradient,
                                shape: BoxShape.circle),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    AppBar().preferredSize.height / 1.2),
                                child: Icon(
                                  Icons.person_add,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height! / 40,
                ),
                Text('Attendees', style: AppTheme.heading(height! / 23)),
                SizedBox(
                  height: height! / 20,
                ),
                attendeeTile(context),
                SizedBox(
                  height: height! / 80,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: height! / 40,
                ),
                attendeeTile(context),
                SizedBox(
                  height: height! / 80,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: height! / 40,
                ),
                attendeeTile(context),
                SizedBox(
                  height: height! / 80,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: height! / 40,
                ),
                attendeeTile(context),
                SizedBox(
                  height: height! / 80,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: height! / 40,
                ),
                attendeeTile(context),
                SizedBox(
                  height: height! / 80,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: height! / 40,
                ),
                attendeeTile(context),
                SizedBox(
                  height: height! / 80,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: height! / 40,
                ),
                attendeeTile(context),
                SizedBox(
                  height: height! / 80,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: height! / 40,
                ),
                attendeeTile(context),
                SizedBox(
                  height: height! / 80,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: height! / 40,
                ),
                attendeeTile(context),
                SizedBox(
                  height: height! / 80,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: height! / 40,
                ),
                attendeeTile(context),
                SizedBox(
                  height: height! / 80,
                ),
                Divider(
                  thickness: 2,
                ),
              ],
            )),
      ),
    );
  }

  Widget attendeeTile(context) {
    return Row(
      children: [
        Container(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, ProfileScreen.id);
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
                        'https://images.unsplash.com/photo-1597733336794-12d05021d510?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80'),

                    placeholder: FileImage(File(Constants.noProfileUrl)),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.file(File(Constants.noProfileUrl),
                          fit: BoxFit.cover);
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
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
        ),
        CustomButton(
            text: 'Request',
            textSize: height! / 25,
            height: height! / 10,
            width: width! / 4,
            onPressed: callback),
      ],
    );
  }
}
