import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import 'package:zyesta_app/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/QRscreen/widgets/buttons.dart';
import 'package:zyesta_app/screens/QRscreen/widgets/profile_image.dart';
import 'package:zyesta_app/utils/const.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

class MyCode extends StatefulWidget {
  static const String id = 'my_code_screen';

  @override
  _MyCodeState createState() => _MyCodeState();
}

class _MyCodeState extends State<MyCode> {
  String username = Constants.userData.username.toString();
  String finalImageUrl =
      "https://zyestabackendcloud.s3.us-east-2.amazonaws.com/${Constants.userData.profileImageUrl}" +
          '#' +
          Random().nextInt(100000000).toString();
  GlobalKey globalKey = new GlobalKey();

  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      WcFlutterShare.share(
          sharePopupTitle: 'share',
          fileName: 'share.png',
          mimeType: 'image/png',
          bytesOfFile: pngBytes);
    } catch(e) {
      print(e.toString());
    }
  }

  _saveScreen() async {
    await _requestPermission();
    RenderRepaintBoundary boundary =
    globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
      await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print(result["isSuccess"]);
      if(result["isSuccess"]){
        Fluttertoast.showToast(
          msg: "Qr code successfully saved to gallery!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor:Color(0xFF0F59C7),
          textColor: Colors.white,
          fontSize: 16,
        );
      }
      else{
        Fluttertoast.showToast(
          msg: "Oops! Storage permission denied, please enable it in device settings.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xFF0F59C7),
          textColor: Colors.white,
          fontSize: 16,
        );
      }
    }
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        decoration: BoxDecoration(
          gradient: AppTheme.backgroundcolorgradient,
        ),
        child: Padding(
          padding: EdgeInsets.only(right:10.w,left: 10.w,top: 5.h,bottom: 5.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RepaintBoundary(
                key: globalKey,
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 7.h),
                        child: Container(
                          padding: EdgeInsets.only(top: 8.h,right: 2.h,left: 2.h,bottom: 2.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Text(Constants.userData.firstName!+" "+Constants.userData.lastName!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
                              Text(Constants.userData.about!,style: AppTheme.kHeadingTextStyle,overflow: TextOverflow.ellipsis,),
                              QrImage(data: username,size: 30.h,foregroundColor: Color(
                                  0xFF7E42A0),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ProfileImage(finalImageUrl: finalImageUrl)
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              GestureDetector(onTap:(){
                _captureAndSharePng();
              },child: QrButton(text: "Share My Code", icon: FontAwesomeIcons.shareAlt)),
              SizedBox(
                height: 1.h,
              ),
              GestureDetector(onTap:(){
                _saveScreen();
              },child: QrButton(text: "Save My Code", icon: FontAwesomeIcons.save)),
            ],
          ),
        ),
      ),
    );
  }
}

