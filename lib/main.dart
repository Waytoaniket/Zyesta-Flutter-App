import 'package:flutter/material.dart';
import 'package:zyesta_app/authenticate.dart';
import 'package:zyesta_app/screens/Chat/chat_main_page.dart';
import 'package:zyesta_app/screens/Chat/chat_list.dart';
import 'package:zyesta_app/screens/Chat/chat_room.dart';
import 'package:zyesta_app/screens/Chat/request_list.dart';
import 'package:zyesta_app/screens/EventDetails/eventDetails.dart';
import 'package:zyesta_app/screens/IntroScreens/first_intro.dart';
import 'package:zyesta_app/screens/IntroScreens/landing_page.dart';
import 'package:zyesta_app/screens/IntroScreens/second_intro.dart';
import 'package:zyesta_app/screens/NewEvent/hostEvent.dart';
import 'package:zyesta_app/screens/NewEvent/postEvent.dart';
import 'package:zyesta_app/screens/OtherProfile/otherProfile.dart';
import 'package:zyesta_app/screens/QRscreen/qr_screen.dart';
import 'package:zyesta_app/screens/QRscreen/widgets/mycode.dart';
import 'package:zyesta_app/screens/QRscreen/widgets/scan.dart';
import 'package:zyesta_app/screens/Registration/registration_page.dart';
import 'package:zyesta_app/screens/Settings/settings.dart';
import 'package:zyesta_app/screens/blockedUsers/all_blocked.dart';
import 'package:zyesta_app/screens/login/login_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/profile/profile_screen.dart';
import 'package:zyesta_app/screens/HomePage/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.light(),
          home: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ZyestaApp',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: Authenticate.id,
            routes: {
              Authenticate.id: (context) => Authenticate(),
              LoginScreen.id: (context) => LoginScreen(),
              RegistrationPage.id: (context) => RegistrationPage(),
              HomeScreen.id: (context) => HomeScreen(),
              ProfileScreen.id: (context) => ProfileScreen(),
              HostNewEvent.id: (context) => HostNewEvent(),
              PostNewEvent.id: (context) => PostNewEvent(),
              EventDetails.id: (context) => EventDetails(),
              FirstIntro.id: (context) => FirstIntro(),
              SecondIntro.id: (context) => SecondIntro(),
              LandingPage.id: (context) => LandingPage(),
              ChatMainScreen.id: (context) => ChatMainScreen(),
              ChatRoom.id: (context) => ChatRoom(),
              ChatList.id: (context) => ChatList(),
              RequestList.id: (context) => RequestList(),
              QRScreen.id:(context) => QRScreen(),
              ScanScreen.id:(context) => ScanScreen(),
              MyCode.id:(context) => MyCode(),
              Settings.id:(context) => Settings(),
              OtherProfile.id:(context) => OtherProfile(userName: '',),
              AllBlockedUsers.id:(context)=> AllBlockedUsers(),
            },
          ),
        );
      },
    );
  }
}
