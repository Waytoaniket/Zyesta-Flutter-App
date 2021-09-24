import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zyesta_app/screens/model/EventDataModel.dart';
import 'package:zyesta_app/screens/model/userdatamodel.dart';
import 'package:zyesta_app/utils/const.dart';

class ApiProvider {
  Future registerUser(
      registerHash, File imageFile, Function updateUserData) async {
    print(registerHash);
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    var stream = new ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var request = new MultipartRequest("POST", Constants.registerURL);
    request.headers.addAll(headers);
    var pic =
        new MultipartFile('image', stream, length, filename: imageFile.path);
    request.fields.addAll(registerHash);
    request.files.add(pic);
    try {
      var response = await request.send().timeout(
        Duration(seconds: 12),
        onTimeout: () {
          // time has run out, do what you wanted to do
          print("timeout");
          throw "TimeOut";
        },
      );
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print(request.fields);
      print(responseString);
      print(json.decode(
          '{"success":false,"message":"We have Some Internal Issuse!"}'));

      if (json.decode(responseString)["success"] == true &&
          json.decode(responseString)['user']["userId"] != null) {
        UserDataModel userData =
            UserDataModel.fromJson(json.decode(responseString));
        updateUserData(userData);
        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString('accesstoken', userData.accesstoken!);
        await prefs.setString('userId', userData.userId!);
        await prefs.setString('token', userData.token!);
        await prefs.setBool('verifiedEmail', userData.verifiedEmail!);
        await prefs.setString('username', userData.username!);
        await prefs.setString('firstName', userData.firstName!);
        await prefs.setString('lastName', userData.lastName!);
        await prefs.setString('email', userData.email!);
        await prefs.setString('mobile', userData.mobile!);
        await prefs.setString('password', userData.password!);
        await prefs.setString('profileImageUrl', userData.profileImageUrl!);
        await prefs.setInt('age', userData.age!);
        await prefs.setString('gender', userData.gender!);
        await prefs.setString('accesstoken', userData.accesstoken!);
        await prefs.setString('city', userData.city!);
        await prefs.setString('about', userData.about!);
        await prefs.setString('interests', userData.interests!);
        await prefs.setString('job_role', userData.job_role!);
        await prefs.setString('company', userData.company!);
        await prefs.setString('university', userData.university!);
        await prefs.setString('qualification', userData.qualification!);
        return json.decode(responseString);
      }
      return json.decode(responseString);
    } catch (_) {
      if (_.toString() == "TimeOut") {
        return json.decode(
            '{"success":false,"message":"We have Some Internal Issuse!"}');
      }
    }
  }

  Future userNameValidation(registerHash) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    String jsonRequest = json.encode(registerHash);
    // make POST request
    Response response = await post(Constants.userNameValidationURL,
            headers: headers, body: jsonRequest)
        .timeout(Duration(seconds: 12), onTimeout: () {
      // time has run out, do what you wanted to do
      print("timeout");
      return Response(
          '{"success":false,"message":"We have Some Internal Issuse!"}', 404);
    });
    return json.decode(response.body);
  }

  Future emailVerification() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Constants.userData.accesstoken}',
    };
    // make POST request
    Response response = await post(
      Constants.emailValidationURL,
      headers: headers,
    ).timeout(
      Duration(seconds: 12),
      onTimeout: () {
        // time has run out, do what you wanted to do
        print("timeout");
        return Response(
            '{"success":false,"message":"We have Some Internal Issuse!"}', 404);
      },
    );
    return json.decode(response.body);
  }

  Future resendEmail(emailHash) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    String jsonRequest = json.encode(emailHash);

    Response response = await post(
      Constants.resendEmailURL,
      headers: headers,
      body: jsonRequest,
    ).timeout(
      Duration(seconds: 12),
      onTimeout: () {
        // time has run out, do what you wanted to do
        print("timeout");
        return Response(
            '{"success":false,"message":"We have Some Internal Issuse!"}', 404);
      },
    );
    return json.decode(response.body);
  }

  Future postEvent(registerHash, File imageFile) async {
    print(registerHash);
    print('-------------');
    // print(Constants.userData.accesstoken);
    // print(Constants.userData.token);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Constants.userData.accesstoken}',
    };
    var stream = new ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var request = new MultipartRequest("POST", Constants.postEventURL);
    request.headers.addAll(headers);
    var pic =
        new MultipartFile('image', stream, length, filename: imageFile.path);
    request.fields.addAll(registerHash);
    request.files.add(pic);
    // print('0000000000');
    print(request.fields);
    try {
      var response = await request.send().timeout(
        Duration(seconds: 12),
        onTimeout: () async {
          // time has run out, do what you wanted to do
          print("timeout");
          throw "TimeOut";
        },
      );
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);

      print(jsonDecode(responseString));
      return json.decode(responseString);
    } catch (_) {
      if (_.toString() == "TimeOut") {
        return json.decode(
            '{"success":false,"message":"We have Some Internal Issuse!"}');
      }
    }
  }

  Future editEvent(registerHash, File imageFile) async {
    print(registerHash);
    print('-------------');
    // print(Constants.userData.accesstoken);
    // print(Constants.userData.token);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Constants.userData.accesstoken}',
    };
    var stream = new ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var request = new MultipartRequest("POST", Constants.editEventURL);
    request.headers.addAll(headers);
    var pic =
        new MultipartFile('image', stream, length, filename: imageFile.path);
    request.fields.addAll(registerHash);
    request.files.add(pic);
    // print('0000000000');
    print(request.fields);
    try {
      var response = await request.send().timeout(
        Duration(seconds: 12),
        onTimeout: () {
          // time has run out, do what you wanted to do
          print("timeout");
          throw "TimeOut";
        },
      );
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print(responseData);
      print(responseString);
      print(jsonDecode(responseString));

      return json.decode(responseString);
    } catch (_) {
      if (_.toString() == "TimeOut") {
        return json.decode(
            '{"success":false,"message":"We have Some Internal Issuse!"}');
      }
    }
  }

  Future<dynamic> seeAllEvent(registerHash) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Constants.userData.accesstoken}',
    };
    String jsonRequest = json.encode(registerHash);
    // make POST request
    Response response =
        await post(Constants.seeEventURL, headers: headers, body: jsonRequest)
            .timeout(
      Duration(seconds: 15),
      onTimeout: () {
        // time has run out, do what you wanted to do
        print("timeout");
        return Constants.eventList;
      },
    );
    print(response);
    print(response.body);
    var data = json.decode(response.body);
    if (data != null && data['success']) {
      // print(data['events']);
      return EventDataModel.fromJson(data).eventList!;
    } else {
      return Constants.eventList;
    }
  }

  Future deletePost(deleteHash) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Constants.userData.accesstoken}',
    };

    String jsonRequest = json.encode(deleteHash);

    Response response = await post(
      Constants.deleteEventURL,
      headers: headers,
      body: jsonRequest,
    ).timeout(
      Duration(seconds: 12),
      onTimeout: () {
        // time has run out, do what you wanted to do
        print("timeout");
        return Response(
            '{"success":false,"message":"We have Some Internal Issuse!"}', 404);
      },
    );
    return json.decode(response.body);
  }
}
