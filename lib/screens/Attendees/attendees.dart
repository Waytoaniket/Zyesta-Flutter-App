import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/screens/Attendees/widget/attendeeCard.dart';
import 'package:zyesta_app/screens/SearchByVenueAndIntrest/searchmainpage.dart';
import 'package:zyesta_app/screens/widgets/appbar.dart';
import 'package:zyesta_app/screens/widgets/custombutton.dart';

import '../../app_theme.dart';

class SeeAllAttendees extends StatefulWidget {
  static const String id = 'SeeAllAttendees';

  const SeeAllAttendees({
    Key? key,
  }) : super(key: key);

  @override
  _SeeAllAttendeesState createState() => _SeeAllAttendeesState();
}

class _SeeAllAttendeesState extends State<SeeAllAttendees> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: Container(
        color: AppTheme.nearlyWhite,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar(context, 'Event Attendees'),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      AttendeeCard(
                        name: "Music Concert",
                        place: "Mumbai",
                        attendees: "540 members are going to this event",
                        imagePath: "assets/images/homepage/card.png",
                        height: height / 2.15,
                        width: width,
                        callback: () {},
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: CustomButton(
                              text: 'See All Events',
                              textSize: 18,
                              height: height / 20,
                              width: width / 2.5,
                              onPressed: seeAllEvents))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void seeAllEvents() {
    Navigator.popUntil(context, ModalRoute.withName('home_screen'));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SearchByVenueAndIntrest(
            title: 'Venue',
          );
        },
      ),
    );
  }
}
