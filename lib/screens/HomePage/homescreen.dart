import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zyesta_app/screens/Animation/CardAnimation.dart';
import 'package:zyesta_app/screens/Notifications/sideDrawer.dart';
import 'package:zyesta_app/screens/HomePage/widget/addressbar.dart';
import 'package:zyesta_app/screens/HomePage/widget/cardtitle.dart';
import 'package:zyesta_app/screens/HomePage/widget/carousel.dart';
import 'package:zyesta_app/screens/widgets/bottomNavigatorBar.dart';
import 'package:zyesta_app/screens/widgets/custombutton.dart';
import 'package:zyesta_app/screens/HomePage/widget/appbar.dart';
import 'package:zyesta_app/screens/HomePage/widget/emailVerificationAlert.dart';
import 'package:zyesta_app/screens/HomePage/widget/searchbar.dart';
import 'package:zyesta_app/screens/SearchByVenueAndIntrest/searchmainpage.dart';
import 'package:zyesta_app/services/api.dart';
import 'package:zyesta_app/services/localdata.dart';
import 'package:zyesta_app/utils/const.dart';

import '../../app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences? prefs;
  @override
  void initState() {
    Constants.eventList =
        ApiProvider().seeAllEvent({'location': 'Garden, Mumbai'});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(Constants.userData.profileImageUrl);
    if (!Constants.userData.verifiedEmail!) {
      Future.delayed(Duration.zero, () => emailValidator(context, updateEmail));
    }
    return Scaffold(
      body: Builder(
        builder: (BuildContext cxt) {
          return buildRefreshIndicator(size, cxt);
        },
      ),
      endDrawer: SideDrawer(),
      bottomNavigationBar: bottomNavigatorBar(0),
    );
  }

  Future<void> _refresh() async {
    if (!mounted) return;
    getEvent();
  }

  RefreshIndicator buildRefreshIndicator(Size size, scaffoldContext) {
    return RefreshIndicator(
      color: AppTheme.primaryColor,
      child: Container(
        color: AppTheme.nearlyWhite,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              homeAppBar(scaffoldContext, _refresh),
              Expanded(child: getEventList(size))
            ],
          ),
        ),
      ),
      onRefresh: _refresh,
    );
  }

  FutureBuilder buildFutureBuilder(Size size) {
    return FutureBuilder(
      future: Constants.eventList,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              height: size.height / 3.8,
              child: Image.asset('assets/images/homepage/imageLoader.gif'));
        } else if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.only(top: 5),
            child: CardAnimation(
              cardList: snapshot.data,
              height: size.height / 3.8,
            ),
          );
        } else {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              height: size.height / 3.8,
              child: Center(child: Text('No Posts Available Refresh')));
        }
      },
    );
  }

  getEventList(Size size) {
    // print(snapshot);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          searchbar(context, size, venueButtonclick, intrestButtonclick),
          addressbar(size),
          carousel(size),
          cardtitle(context, size, "Top Picks For You!", false, onButtonclick),
          buildFutureBuilder(size),
          cardtitle(
              context, size, "Recommended Venues", false, venueButtonclick),
          buildFutureBuilder(size),
          cardtitle(context, size, "Recommended Interests", false,
              intrestButtonclick),
          buildFutureBuilder(size),
          cardtitle(context, size, "EXCLUSIVE EVENTS", true, onButtonclick),
          buildFutureBuilder(size),
          Padding(
            padding: EdgeInsets.all(40.0),
            child: CustomButton(
                text: 'Upgrade Membership',
                textSize: 20,
                height: size.height / 16,
                width: size.height / 3,
                onPressed: onButtonclick),
          ),
        ],
      ),
    );
  }

  void updateEmail() {
    setState(() {
      Constants.userData.verifiedEmail = true;
      Localdata().updateVerifiedEmail(true);
      Navigator.of(context, rootNavigator: true).pop();
    });
  }

  void venueButtonclick() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchByVenueAndIntrest(
          title: 'Venues',
        ),
      ),
    );
  }

  void intrestButtonclick() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchByVenueAndIntrest(
          title: 'Intrests',
        ),
      ),
    );
  }

  void onButtonclick() {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => MapScreen()));
  }

  void getEvent() async {
    setState(() {
      Constants.eventList =
          ApiProvider().seeAllEvent({'location': 'Garden, Mumbai'});
    });
  }
}
