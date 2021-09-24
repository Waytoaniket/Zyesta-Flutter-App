import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:zyesta_app/screens/Chat/chat_list.dart';
import 'package:zyesta_app/screens/Chat/request_list.dart';
import 'package:zyesta_app/screens/Chat/widgets/chat_app_bar.dart';
import 'package:zyesta_app/screens/widgets/bottomNavigatorBar.dart';

class ChatMainScreen extends StatefulWidget {
  static const String id = 'ChatMainScreen';

  ChatMainScreen({Key? key}) : super(key: key);

  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: bottomNavigatorBar(1),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              chatAppbar(context, 'Chats'),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: TabBar(
                      indicatorColor: AppTheme.primaryColor1,
                      labelStyle: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: size.height * .02,
                          fontWeight: FontWeight.bold),
                      labelColor: AppTheme.primaryColor,
                      tabs: [
                        Tab(
                          text: 'My Chats',
                        ),
                        Tab(
                          text: 'Requests',
                        ),
                      ],
                    ),
                    body: TabBarView(
                      children: [
                        ChatList(),
                        RequestList(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
