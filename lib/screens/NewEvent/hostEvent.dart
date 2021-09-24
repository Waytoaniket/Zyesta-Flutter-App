import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/widgets/appbar.dart';
import 'package:zyesta_app/screens/NewEvent/widget/agerange.dart';
import 'package:zyesta_app/screens/NewEvent/widget/category.dart';
import 'package:zyesta_app/screens/NewEvent/widget/inputfield.dart';
import 'package:zyesta_app/screens/widgets/custombutton.dart';

class HostNewEvent extends StatefulWidget {
  static const String id = 'HostNewEvent';

  const HostNewEvent({Key? key}) : super(key: key);

  @override
  _HostNewEventState createState() => _HostNewEventState();
}

class _HostNewEventState extends State<HostNewEvent> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _dateTime = TextEditingController();
  final TextEditingController _description = TextEditingController();
  CategoryType categoryType = CategoryType.male;
  RangeValues _values = const RangeValues(18, 45);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
        body: Container(
            decoration:
                BoxDecoration(gradient: AppTheme.lightbackgroundcolorgradient),
            child: Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appBar(context, 'Host Your Event'),
                      Expanded(
                          child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 25.0, bottom: 5, left: 5, right: 5.0),
                                child: Text(
                                  'Tell Us About Where You Are Headed To...',
                                  style: AppTheme.lighttextStyle(width / 25,
                                      weight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              getInputField(height, width, 'Event Name', _name),
                              getInputField(
                                  height, width, 'Event Location', _location),
                              getInputField(
                                  height, width, 'Event Date', _dateTime),
                              getMultiLineInputField(
                                  height, width, 'About Event', _description),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 5),
                                  child: Text(
                                    'Add More Info For Private Event',
                                    style: AppTheme.lighttextStyle(width / 25,
                                        weight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                    height: height / 6,
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(width / 20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: getCategoryUI(height, width,
                                        categoryType, updateCategory)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                    height: height / 6,
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(width / 20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: ageRangeFilter(
                                        context, _values, width)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: width / 20,
                                    horizontal: width / 25),
                                child: CustomButton(
                                    text: 'Publish Event!',
                                    textSize: width / 20,
                                    height: width / 6,
                                    width: width,
                                    onPressed: onButtonclick),
                              )
                            ],
                          ),
                        ),
                      ))
                    ]))));
  }

  void updateCategory(CategoryType categoryTypeData) {
    setState(() {
      categoryType = categoryTypeData;
    });
  }

  void onButtonclick() {}
}
