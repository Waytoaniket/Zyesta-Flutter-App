import 'package:flutter/cupertino.dart';
import 'package:zyesta_app/screens/Chat/widgets/chat_tile.dart';

class ChatList extends StatefulWidget {
  static const String id = 'ChatList';

  ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ChatTile(),
          ChatTile(),
          ChatTile(),
          ChatTile(),
          ChatTile(),
          ChatTile(),
          ChatTile(),
          ChatTile(),
          ChatTile(),
          ChatTile(),
        ],
      ),
    );
  }
}
