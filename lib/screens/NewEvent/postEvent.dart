import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/HomePage/homescreen.dart';
import 'package:zyesta_app/screens/model/EventDataModel.dart';
import 'package:zyesta_app/screens/widgets/appbar.dart';
import 'package:zyesta_app/screens/NewEvent/widget/imagefield.dart';
import 'package:zyesta_app/screens/NewEvent/widget/inputfield.dart';
import 'package:zyesta_app/screens/widgets/custombutton.dart';
import 'package:zyesta_app/services/api.dart';
import 'package:zyesta_app/utils/const.dart';

class PostNewEvent extends StatefulWidget {
  static const String id = 'PostNewEvent';
  final EventData? eventData;

  const PostNewEvent({Key? key, this.eventData}) : super(key: key);

  @override
  _PostNewEventState createState() => _PostNewEventState();
}

class _PostNewEventState extends State<PostNewEvent> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _dateTime = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _selectedType = 'Club';
  ImagePicker _picker = ImagePicker();
  bool isLoading = false;

  File? _image;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.eventData != null) {
      _selectedType = widget.eventData!.type!;
      _name.text = widget.eventData!.name!;
      _location.text = widget.eventData!.location!;
      _dateTime.text = widget.eventData!.date!;
      _description.text = widget.eventData!.about!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      body: ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            color: AppTheme.primaryColor,
          ),
          inAsyncCall: isLoading,
          child: Container(
              child: Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.eventData == null
                            ? appBar(context, 'Post Your Event')
                            : appBar(context, 'Edit Your Event'),
                        Expanded(
                            child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 25.0,
                                          bottom: 5,
                                          left: 5,
                                          right: 5.0),
                                      child: Text(
                                        'Tell Us About Where Your Event...',
                                        style: AppTheme.lighttextStyle(
                                            width / 25,
                                            weight: FontWeight.w500),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  getDropDownInput(
                                      height,
                                      width,
                                      'Kind of Event',
                                      _selectedType,
                                      updateDropDownValue),
                                  getInputField(
                                      height, width, 'Event Name', _name),
                                  getInputField(height, width, 'Event Location',
                                      _location),
                                  getInputField(
                                      height, width, 'Date & Time', _dateTime),
                                  getMultiLineInputField(height, width,
                                      'Description', _description),
                                  if (_image != null)
                                    showImage(
                                        _image!, height, width, discardImage),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: width / 20,
                                        horizontal: width / 25),
                                    child: CustomButton(
                                        text: 'Publish Event!',
                                        textSize: width / 20,
                                        height: width / 6,
                                        width: width,
                                        onPressed: widget.eventData == null
                                            ? postEvent
                                            : editEvent),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                      ])))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage();
        },
        child: Icon(
          Icons.add_a_photo,
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
    );
  }

  void updateDropDownValue(String val) {
    setState(() {
      _selectedType = val;
    });
  }

  getImage() async {
    PickedFile? pickedfile =
        await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedfile!.path);
    });
  }

  discardImage() {
    setState(() {
      _image = null;
    });
  }

  postEvent() {
    if (_image != null) {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });
        File imageFile = new File(_image!.path);

        final Map<String, String> data = new Map<String, String>();
        data['type'] = _selectedType;
        data['name'] = _name.text;
        data['date'] = _dateTime.text;
        data['location'] = _location.text;
        data['time'] = '5';
        data['about'] = _description.text;
        data['contact'] = Constants.userData.mobile!;
        data['preps'] = '';

        ApiProvider().postEvent(data, imageFile).then((response) {
          if (response != null && response['success']) {
            print(response);

            Fluttertoast.showToast(
                msg: response['message'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1);
            //         setState(() {
            //   isLoading = true;
            // });
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.id, (route) => false);
            print("Account Created Sucessfull");
          } else {
            Fluttertoast.showToast(
                msg: response['message'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1);
            setState(() {
              isLoading = false;
            });
          }
        });
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Please Select An Image',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1);
    }
  }

  editEvent() {
    if (_image != null) {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });
        File imageFile = new File(_image!.path);

        final Map<String, String> data = new Map<String, String>();
        data['event_id'] = widget.eventData!.eventId!;
        data['type'] = _selectedType;
        data['name'] = _name.text;
        data['date'] = _dateTime.text;
        data['location'] = _location.text;
        data['time'] = '5';
        data['about'] = _description.text;
        data['contact'] = Constants.userData.mobile!;
        data['preps'] = '';

        ApiProvider().editEvent(data, imageFile).then((response) {
          if (response != null && response['success']) {
            print(response);

            Fluttertoast.showToast(
                msg: response['message'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1);
            //         setState(() {
            //   isLoading = true;
            // });
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.id, (route) => false);
          } else {
            Fluttertoast.showToast(
                msg: response['message'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1);
            setState(() {
              isLoading = false;
            });
          }
        });
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Please Select An Image',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1);
    }
  }
}
