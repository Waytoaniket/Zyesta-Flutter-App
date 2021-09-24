import 'package:shared_preferences/shared_preferences.dart';

class Localdata {

  Future updateVerifiedEmail(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('verifiedEmail', value);
  }

}
