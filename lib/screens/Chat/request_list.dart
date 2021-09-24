import 'package:flutter/cupertino.dart';
import 'package:zyesta_app/screens/Chat/widgets/request_tile.dart';

class RequestList extends StatefulWidget {
  static const String id = 'RequestList';

  RequestList({Key? key}) : super(key: key);

  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          RequestTile(),
          RequestTile(),
          RequestTile(),
          RequestTile(),
          RequestTile(),
          RequestTile(),
          RequestTile(),
          RequestTile(),
          RequestTile(),
          RequestTile(),
        ],
      ),
    );
  }
}
