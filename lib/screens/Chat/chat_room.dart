import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/screens/Chat/widgets/chat_bubble.dart';
import 'package:zyesta_app/screens/Chat/widgets/chat_room_appbar.dart';
import 'package:zyesta_app/screens/Chat/widgets/inputfield.dart';

import '../../app_theme.dart';

class ChatRoom extends StatefulWidget {
  static const String id = 'ChatRoom';

  ChatRoom({Key? key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController message = TextEditingController();
  bool enableSend = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundcolorgradient),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              chatRoomAppbar(context, 'Nida Chauhan'),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      chatBubble(size, true),
                      chatBubble(size, false),
                      chatBubble(size, false),
                      chatBubble(size, true),
                      chatBubble(size, true),
                      chatBubble(size, false),
                      chatBubble(size, true),
                      chatBubble(size, false),
                      chatBubble(size, false),
                      chatBubble(size, true),
                      chatBubble(size, true),
                      chatBubble(size, false),
                    ],
                  ),
                ),
              ),
              chatInputField(
                size,
                context,
                "Say something…",
                Icons.ac_unit,
                message,
                TextInputType.multiline,
                enableSend,
                changeSendButton,
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeSendButton(bool value) {
    setState(() {
      enableSend = value;
    });
  }
}
