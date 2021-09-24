import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/screens/HomePage/homescreen.dart';
import 'package:zyesta_app/screens/widgets/custombutton.dart';
import 'package:zyesta_app/screens/widgets/dateAndTimeInput.dart';
import 'package:intl/intl.dart';

import '../../../app_theme.dart';

meetDialog(mainContext, Size size) {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  getDate() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: mainContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              surface: AppTheme.nearlyWhite,
              onSurface: AppTheme.primaryColor,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    selectedDate.then(
      (value) {
        if (value != null)
          dateController.text = DateFormat('dd-MM-yy').format(value);
      },
    );
  }

  getTime() {
    Future<TimeOfDay?> selectedTime = showTimePicker(
      initialTime: TimeOfDay.now(),
      context: mainContext,
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              surface: AppTheme.nearlyWhite,
              onSurface: AppTheme.primaryColor,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    selectedTime.then((value) {
      if (value != null) timeController.text = value.format(mainContext);
    });
  }

  showDialog(
    context: mainContext,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'Send Meet Request to Nida Chauhan?',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DateTimeInputField(
                  text: "Date",
                  hintText: "dd-mm-yy",
                  controller: dateController,
                  callback: getDate,
                  suffixIcon: Container(
                    width: size.width * .05,
                    margin: EdgeInsets.only(right: size.width * .035),
                    alignment: Alignment.centerRight,
                    child: ImageIcon(
                      AssetImage("assets/images/chat/calendar.png"),
                      color: AppTheme.primaryColor,
                      size: size.width * .05,
                    ),
                  ),
                ),
                DateTimeInputField(
                  text: "Time",
                  hintText: "00:00 AM",
                  controller: timeController,
                  callback: getTime,
                  suffixIcon: Icon(
                    Icons.access_time,
                    color: AppTheme.primaryColor,
                    size: size.width * .05,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * .09,
                      left: size.width * .06,
                      right: size.width * .06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          text: "Request",
                          textSize: 12,
                          height: size.width * .095,
                          width: size.width * .24,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print("Validated");
                              Navigator.of(context, rootNavigator: true).pop();
                              goToHomeDialog(mainContext, size);
                            }
                          }),
                      CustomButton(
                        isColor: false,
                        text: "Cancel",
                        textSize: 12,
                        height: size.width * .095,
                        width: size.width * .24,
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

goToHomeDialog(mainContext, Size size) {
  showDialog(
      context: mainContext,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Send Meet Request to Nida Chauhan?',
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              CustomButton(
                isColor: false,
                text: "Go Home",
                textSize: 12,
                height: size.width * .1,
                width: size.width * .3,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  Navigator.pushNamedAndRemoveUntil(
                      mainContext, HomeScreen.id, (route) => false);
                },
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                  "This Meet will be added to your calendar once the request is accepted.")
            ],
          ),
        );
      });
}

// Widget dialogButton(bool isColor, String text, Function onPressed) {
//   return Container(
//     decoration: BoxDecoration(
//       gradient: isColor
//           ? AppTheme.buttonGradient
//           : LinearGradient(colors: [Colors.transparent, Colors.transparent]),
//       borderRadius: const BorderRadius.all(Radius.circular(24.0)),
//       border: Border.all(color: AppTheme.primaryColor),
//     ),
//     child: Material(
//       color: Colors.transparent,
//       child: InkWell(
//         splashColor: Colors.white24,
//         borderRadius: const BorderRadius.all(Radius.circular(24.0)),
//         onTap: () {
//           onPressed();
//         },
//         child: Padding(
//           padding:
//               const EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
//           child: Center(
//             child: Text(
//               text,
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 12,
//                 letterSpacing: 0.27,
//                 color: isColor ? Colors.white : AppTheme.primaryColor,
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Widget dateAndTimeInput(
//     context,
//     double height,
//     double width,
//     String text,
//     String hintText,
//     TextEditingController _controller,
//     Function callback,
//     suffixIcon) {
//   InputBorder roundedBorder = OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(width / 30)),
//     borderSide: BorderSide(color: AppTheme.primaryColor, width: 1),
//   );
//   final requiredValidator =
//       RequiredValidator(errorText: 'This field is required');
//   return Container(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           text,
//           style: TextStyle(
//               fontSize: width / 22,
//               fontWeight: FontWeight.w400,
//               color: AppTheme.primaryColor),
//         ),
//         Container(
//           width: width * .45,
//           child: Padding(
//             padding: EdgeInsets.only(
//               top: 10.0,
//             ),
//             child: InkWell(
//               onTap: () {
//                 callback();
//               },
//               child: IgnorePointer(
//                 child: TextFormField(
//                   controller: _controller,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   autocorrect: true,
//                   cursorColor: AppTheme.primaryColor,
//                   style: TextStyle(
//                       color: AppTheme.primaryColor,
//                       fontSize: width / 22,
//                       letterSpacing: 1.5),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white70,
//                     enabledBorder: roundedBorder,
//                     focusedBorder: roundedBorder,
//                     border: roundedBorder,
//                     isDense: true, // Added this
//                     contentPadding: EdgeInsets.only(left: width / 25),
//                     helperText: "",
//                     helperStyle: TextStyle(height: 0.5),
//                     errorStyle: TextStyle(height: 0.5),
//                     suffixIcon: suffixIcon,
//                     hintText: hintText,
//                     hintStyle: TextStyle(
//                       color: AppTheme.primaryColor,
//                     ),
//                   ),
//                   validator: requiredValidator,
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }
