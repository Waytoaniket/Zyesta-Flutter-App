import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService{
  Dio dio = new Dio();


  blockUser(accessToken,userId) async {
    try{
      Response response = await dio.post(
          'https://zyestabackend.herokuapp.com/api/user/block',
          data: {
            "blockedUserId": userId
          },
          options: Options(contentType: Headers.formUrlEncodedContentType,headers: {'Authorization' : 'Bearer $accessToken'}));
      if(response.data['message']=="User blocked successfully!"){
        Fluttertoast.showToast(
          msg: "User has been blocked!",
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
        msg: "User could not be blocked!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xFF7819AD),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  unblockUser(accessToken,userId) async {
    try{
      Response response = await dio.post(
          'https://zyestabackend.herokuapp.com/api/user/unblock',
          data: {
            "blockedUserId": userId
          },
          options: Options(contentType: Headers.formUrlEncodedContentType,headers: {'Authorization' : 'Bearer $accessToken'}));
      if(response.data['message']=="User unblocked successfully!"){
        Fluttertoast.showToast(
          msg: "User has been unblocked!",
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
        msg: "User could not be unblocked!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xFF7819AD),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  reportUser(accessToken,userId,message) async {
    try{
      Response response = await dio.post(
          'https://zyestabackend.herokuapp.com/api/user/report',
          data: {
            "message": message,
            "reportUserId": userId,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType,headers: {'Authorization' : 'Bearer $accessToken'}));
      if(response.data['message']=="User Reported successfully!"){
        Fluttertoast.showToast(
          msg: "Reported successfully!",
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
        msg: "Could not be reported!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xFF7819AD),
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

}