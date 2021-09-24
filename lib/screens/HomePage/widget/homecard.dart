import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/EventDetails/eventDetails.dart';
import 'package:zyesta_app/screens/model/EventDataModel.dart';
import 'package:zyesta_app/utils/const.dart';

class HomeCard extends StatelessWidget {
  final EventData? eventData;
  const HomeCard({Key? key, this.eventData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double height = size.height / 4.5;
    double width = size.height / 3.9;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventDetails(
                      eventData: eventData,
                      isEventApproved: false,
                    )));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 15, 6, 15),
        height: height,
        width: width,
        decoration: AppTheme.cardDecoration,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                  padding: EdgeInsets.only(left: height / 20, top: height / 20),
                  child: Text(
                    eventData!.name!,
                    style: TextStyle(
                        fontSize: height / 14,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: height / 20, top: height / 60),
                  child: Text(
                    eventData!.date!,
                    style: TextStyle(
                        fontSize: height / 17,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: height / 20, top: height / 60),
                  child: Text(
                    eventData!.location!,
                    style: TextStyle(
                        fontSize: height / 17,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
