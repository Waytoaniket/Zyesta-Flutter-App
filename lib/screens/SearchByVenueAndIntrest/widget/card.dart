import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/EventDetails/eventDetails.dart';
import 'package:zyesta_app/screens/HomePage/widget/homecard.dart';
import 'package:zyesta_app/screens/model/EventDataModel.dart';
import 'package:zyesta_app/utils/const.dart';

class CardList extends StatelessWidget {
  final HomeCard? object;

  const CardList({Key? key, this.object}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double height = size.width / 3.2;
    double width = size.width / 3;
    return Padding(
      padding: EdgeInsets.all(6),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventDetails(
                        eventData: object!.eventData,
                        isEventApproved: false,
                      )));
        },
        child: Container(
          height: 200,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(width / 10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(width / 10)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FadeInImage(
                    // image: NetworkImage(Constants.userData.profileImageUrl!),
                    image: NetworkImage(Constants.baseImageURL + object!.eventData!.imageUrl!),

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
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: height / 20, top: height / 20),
                      child: Text(
                        object!.eventData!.name!,
                        style: TextStyle(
                            fontSize: height / 8,
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
