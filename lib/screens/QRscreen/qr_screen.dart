import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zyesta_app/screens/QRscreen/widgets/mycode.dart';
import 'package:zyesta_app/screens/QRscreen/widgets/scan.dart';
import 'package:zyesta_app/app_theme.dart';

class QRScreen extends StatefulWidget {
  static const String id = 'qr_screen';

  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {

  TabBar get _tabBar => TabBar(
    labelColor: Color(0xFF7819AD),
    labelStyle: AppTheme.kHeadingTextStyle.copyWith(fontWeight: FontWeight.bold),
    tabs: [
      Tab(text: 'Scan'),
      Tab(text: 'My Code',),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('QR Code'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppTheme.buttoncolorgradient,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: _tabBar,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ScanScreen(),
            MyCode(),
          ],
        ),
      ),
    );
  }
}
