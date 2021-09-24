import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zyesta_app/screens/model/userdatamodel.dart';
import 'package:zyesta_app/screens/login/login_screen.dart';
import 'package:zyesta_app/utils/const.dart';

class AuthService {

  Dio dio = new Dio();



  // login with email
  login(email, password, Function updateUserData) async {
    try {
      Response response = await dio.post(
          'https://zyestabackend.herokuapp.com/api/user/login',
          data: {"username": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));

      UserDataModel userData = UserDataModel.fromJson(response.data);

      print(response.data);
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


      return response;
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response!.data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color(0xFF7819AD),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  // Forgot Password
  forgotPassword(email) async {
    try {
      return await dio.post(
          'https://zyestabackend.herokuapp.com/api/user/forgotPassword',
          data: {
            "email": email,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response!.data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xFF7819AD),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
    return "stop";
  }

  // Verify Email
  verifyEmail(email) async {
    try {
      return await dio.post(
          'https://zyestabackend.herokuapp.com/api/user/resend/email',
          data: {
            "email": email,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response!.data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xFF7819AD),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
    return "stop";
  }

  // Get User Profile
  Future<dynamic> getAuthProfileData(accessToken, userName) async {
    try {
      Response response = await dio.get(
          'https://zyestabackend.herokuapp.com/api/user/$userName',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      return response;
    } on DioError catch (e) {
      print(e.response!.data['message']);
      print("error");
    }
  }

  // Update User Profile
  updateAuthProfileData(accessToken, about, interests, jobRole, company,
      university, firstName, lastName, age, gender, city) async {
    try {
      Response response = await dio.put(
          'https://zyestabackend.herokuapp.com/api/user/edit/profile',
          data: {
            "email": "trying@trying.com",
            "mobile": "123",
            "password": "trying",
            "profileImageUrl": "trying",
            "firstName": firstName,
            "lastName": lastName,
            "age": int.parse(age),
            "gender": gender,
            "city": city,
            "about": about,
            "interests": interests,
            "job_role": jobRole,
            "company": company,
            "university": university,
            "qualification": "nothing"
          },
          options: Options(
              contentType: Headers.formUrlEncodedContentType,
              headers: {'Authorization': 'Bearer $accessToken'}));
      return response;
    } on DioError catch (e) {
      print(e.response!.data['success']);
      print(e.response!.data['message']);
      if (e.response!.data['message'] == "User Updated Successfully!") {
        Fluttertoast.showToast(
          msg: "Profile Updated Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xFF7819AD),
          textColor: Colors.white,
          fontSize: 16,
        );

        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString('about', about);
        await prefs.setString('firstName', firstName);
        await prefs.setString('lastName', lastName);
        await prefs.setInt('age', int.parse(age));
        await prefs.setString('gender', gender);
        await prefs.setString('city', city);
        await prefs.setString('interests', interests);
        await prefs.setString('job_role', jobRole);
        await prefs.setString('company', company);
        await prefs.setString('university', university);
        Constants.userData.about = about;
        Constants.userData.firstName = firstName;
        Constants.userData.lastName = lastName;
        Constants.userData.age = int.parse(age);
        Constants.userData.gender = gender;
        Constants.userData.city = city;
        Constants.userData.interests = interests;
        Constants.userData.job_role = jobRole;
        Constants.userData.company = company;
        Constants.userData.university = university;

      } else {
        Fluttertoast.showToast(
          msg: "Profile could not be updated!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xFF7819AD),
          textColor: Colors.white,
          fontSize: 16,
        );
      }
    }
  }

  // Change User Password
  changeUserPassword(accessToken, oldPassword, newPassword) async {
    try {
      Response response = await dio.post(
          'https://zyestabackend.herokuapp.com/api/user/changePassword',
          data: {"password": oldPassword, "new_password": newPassword},
          options: Options(
              contentType: Headers.formUrlEncodedContentType,
              headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.data['message'] == "Password Updated Successfully!") {
        Fluttertoast.showToast(
          msg: "Password Updated Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xFF7819AD),
          textColor: Colors.white,
          fontSize: 16,
        );
      }
      return response;
    } on DioError catch (e) {
      print(e.response!.data['success']);
      print(e.response!.data['message']);
      Fluttertoast.showToast(
        msg: "Wrong credentials entered,\n password could'nt be updated!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xFF7819AD),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  // Change User Email
  changeUserEmail(accessToken, password, newEmail) async {
    try {
      Response response = await dio.post(
          'https://zyestabackend.herokuapp.com/api/user/changeEmail',
          data: {"password": password, "email": newEmail},
          options: Options(
              contentType: Headers.formUrlEncodedContentType,
              headers: {'Authorization': 'Bearer $accessToken'}));
      if (response.data['message'] == "Email Updated Successfully!") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', newEmail);
        Constants.userData.email = newEmail;
        Fluttertoast.showToast(
          msg: "Email Updated Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xFF7819AD),
          textColor: Colors.white,
          fontSize: 16,
        );
      }
      print(response.data);
      return response;
    } on DioError catch (e) {
      print(e.response!.data['success']);
      print(e.response!.data['message']);
      Fluttertoast.showToast(
        msg: "Wrong credentials entered,\n email could'nt be updated!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xFF7819AD),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  //Change User Mobile No
  changeUserMobileNo(accessToken, password, mobileNo) async {
    try {
      Response response = await dio.post(
          'https://zyestabackend.herokuapp.com/api/user/changeMobile',
          data: {
            "password": password,
            "new_mobile": mobileNo
          },
          options: Options(contentType: Headers.formUrlEncodedContentType,headers: {'Authorization' : 'Bearer $accessToken'}));
      if(response.data['message']=="Mobile Updated Successfully!"){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('mobile', mobileNo);
        Constants.userData.mobile = mobileNo;
        Fluttertoast.showToast(
          msg: "Mobile Number Updated Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xFF7819AD),
          textColor: Colors.white,
          fontSize: 16,
        );
      }
      print(response.data);
      return response;
    } on DioError catch (e) {
      print(e.response!.data['success']);
      print(e.response!.data['message']);
      Fluttertoast.showToast(
        msg: "Wrong credentials entered,\n Mobile Number could'nt be updated!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xFF7819AD),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  //Change UserName
  changeUserName(accessToken,userName) async {
    try{
      Response response = await dio.post(
          'https://zyestabackend.herokuapp.com/api/user/changeUsername',
          data: {
            "new_username": userName
          },
          options: Options(contentType: Headers.formUrlEncodedContentType,headers: {'Authorization' : 'Bearer $accessToken'}));
      if(response.data['message']=="Username Updated Successfully!"){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', userName);
        Constants.userData.username = userName;
        Fluttertoast.showToast(
          msg: "Username Updated Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xFF7819AD),
          textColor: Colors.white,
          fontSize: 16,
        );
      }
      print(response.data);
      return response;
    }on DioError catch(e){
      print(e.response!.data['success']);
      print(e.response!.data['message']);
      Fluttertoast.showToast(
        msg: "Username could not be updated!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xFF7819AD),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  // Update ProfileImage
  changeProfileImage(accessToken,File photoFile) async {
    try{
      if (photoFile.path.isNotEmpty) {
        String fileName = photoFile.path;
        print("File Name : $fileName");
        print("File Size : ${photoFile.lengthSync()}");
        FormData formData = new FormData.fromMap({
          "image": await MultipartFile.fromFile(
            photoFile.path, filename: fileName,)
        });
        Response response = await dio.put(
            'https://zyestabackend.herokuapp.com/api/user/edit/profilepic',
            data: formData,
            options: Options(contentType: Headers.formUrlEncodedContentType,
                headers: {'Authorization': 'Bearer $accessToken'}));
        if (response.data['message'] == "Profile Picture updated successfully!") {
          Fluttertoast.showToast(
            msg: "Profile Picture Updated Successfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Color(0xFF7819AD),
            textColor: Colors.white,
            fontSize: 16,
          );
        }
        print(response.data);
        return response;
      }
    }on DioError catch(e){
      print(e.response!.data['success']);
      print(e.response!.data['message']);
      Fluttertoast.showToast(
        msg: "Profile Picture could not be updated!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xFF7819AD),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  //Delete Profile
  deleteProfile(context,accessToken, password) async {
    try{
      Response response = await dio.delete(
          'https://zyestabackend.herokuapp.com/api/user/delete',
          data: {
            "password": password
          },
          options: Options(contentType: Headers.formUrlEncodedContentType,headers: {'Authorization' : 'Bearer $accessToken'}));
      if(response.data['message']=="Your account has been deleted!"){
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Fluttertoast.showToast(
          msg: "Account Deleted Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xFF7819AD),
          textColor: Colors.white,
          fontSize: 16,
        );
        Navigator.of(context)
            .pushNamedAndRemoveUntil(LoginScreen.id, (Route<dynamic> route) => false);
      }
      print(response.data);
      return response;
    }on DioError catch(e){
      print(e.response!.data['success']);
      print(e.response!.data['message']);
      Fluttertoast.showToast(
        msg: "Account not deleted!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xFF7819AD),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

}
