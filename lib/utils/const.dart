import 'package:zyesta_app/screens/model/userdatamodel.dart';

class Constants {
  static Uri registerURL =
      Uri.parse('https://zyestabackend.herokuapp.com/api/user/register');

  static Uri userNameValidationURL =
      Uri.parse('https://zyestabackend.herokuapp.com/api/user/checkusername');

  static Uri emailValidationURL = Uri.parse(
      'https://zyestabackend.herokuapp.com/api/user/check/verifiedEmail');

  static Uri resendEmailURL =
      Uri.parse('https://zyestabackend.herokuapp.com/api/user/resend/email');

  static Uri postEventURL = Uri.parse(
      'https://zyestabackend.herokuapp.com/auth/user/event/addVenue/');

  static Uri seeEventURL =
      Uri.parse('https://zyestabackend.herokuapp.com/auth/user/event/seeVenue');

  static Uri seeMyEventURL =
      Uri.parse('https://zyestabackend.herokuapp.com/auth/user/event/myVenue');

  static Uri editEventURL = Uri.parse(
      'https://zyestabackend.herokuapp.com/auth/user/event/editVenue');

  static Uri deleteEventURL = Uri.parse(
      'https://zyestabackend.herokuapp.com/auth/user/event/deleteVenue');

  static String noProfileUrl =
      '/data/user/0/com.example.zyesta_app/cache/noprofile.png';

  static String baseImageURL =
      'https://zyestabackendcloud.s3.us-east-2.amazonaws.com/';

  static UserDataModel userData = UserDataModel();

  static dynamic eventList;
}
