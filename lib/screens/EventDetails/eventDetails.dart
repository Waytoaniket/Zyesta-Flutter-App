import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/Attendees/attendees.dart';
import 'package:zyesta_app/screens/EventDetails/widget/eventApprovedCard.dart';
import 'package:zyesta_app/screens/EventDetails/widget/eventDetailsCard.dart';
import 'package:zyesta_app/screens/SearchByVenueAndIntrest/searchmainpage.dart';
import 'package:zyesta_app/screens/model/EventDataModel.dart';
import 'package:zyesta_app/screens/widgets/appbar.dart';
import 'package:zyesta_app/screens/widgets/bottomNavigatorBar.dart';
import 'package:zyesta_app/screens/widgets/custombutton.dart';

class EventDetails extends StatefulWidget {
  static const String id = 'EventDetails';
  final EventData? eventData;
  final bool? isEventApproved;

  const EventDetails({Key? key, this.eventData, this.isEventApproved})
      : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
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
              widget.isEventApproved!
                  ? appBar(context, 'Event Details')
                  : appBar(context, 'Event'),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      if (widget.isEventApproved!)
                        EventApprovedCard(
                          eventData: widget.eventData,
                          callback: () {},
                        ),
                      if (!widget.isEventApproved!)
                        EventDetailsCard(
                          eventData: widget.eventData,
                          callback: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeeAllAttendees()));
                          },
                        ),
                      if (!widget.isEventApproved!)
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
      bottomNavigationBar: bottomNavigatorBar(null),
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
