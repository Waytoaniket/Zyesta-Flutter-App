import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zyesta_app/screens/Chat/widgets/sendButton.dart';

import '../../../app_theme.dart';

Widget chatInputField(
  Size size,
  context,
  String hintText,
  IconData icon,
  TextEditingController cont,
  TextInputType textinput,
  bool enableSend,
  Function changeSendButton,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * .82,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(size.width * 0.08),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onFieldSubmitted: (value) {},
                      onChanged: (value) {
                        if (value.isEmpty || value.trim() == "") {
                          changeSendButton(false);
                        } else {
                          changeSendButton(true);
                        }
                      },
                      keyboardType: textinput,
                      controller: cont,
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: size.width * .045,
                      ),
                      minLines: 1,
                      cursorColor: AppTheme.primaryColor1,
                      decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: size.width * .045,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.08),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.all(size.width * .03)),
                    ),
                  ),
                ),
                iconDecoration(icon, size)
              ],
            ),
          ),
          sendButton(context, size, enableSend)
        ],
      ),
    ),
  );
}

Widget iconDecoration(icon, Size size) {
  return Padding(
    padding: EdgeInsets.only(bottom: size.width * .02, right: size.width * .04),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.mic,
          color: AppTheme.primaryColor,
          size: size.width * .07,
        ),
        Icon(
          Icons.camera_alt,
          color: AppTheme.primaryColor,
          size: size.width * .07,
        )
      ],
    ),
  );
}

