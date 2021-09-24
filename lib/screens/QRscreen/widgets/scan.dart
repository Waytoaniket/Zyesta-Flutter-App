import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'dart:async';
import 'package:zyesta_app/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/OtherProfile/otherProfile.dart';
import 'package:zyesta_app/screens/QRscreen/widgets/buttons.dart';
import 'package:zyesta_app/services/api.dart';

class ScanScreen extends StatefulWidget {
  static const String id = 'scan_screen';

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String _scanBarcode = 'Unknown';
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#D876F2', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    if (barcodeScanRes != "-1") {
      setState(() {
        isLoading = !isLoading;
      });
      print(barcodeScanRes);
      print("checking");
      await ApiProvider()
          .userNameValidation({'username': barcodeScanRes}).then((response) {
        print("done");
        setState(() {
          isLoading = !isLoading;
        });
        print(response['success']);
        if (response['success']) {
          Fluttertoast.showToast(
            msg: "Oops! User not Present.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Color(0xFF7819AD),
            textColor: Colors.white,
            fontSize: 16,
          );
          // setState(() {
          //   _scanBarcode = "not present";
          // });
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OtherProfile(
                userName: barcodeScanRes,
              ),
            ),
          );
          // setState(() {
          //   _scanBarcode = "present";
          // });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      opacity: 0.5,
      progressIndicator: SpinKitFadingCircle(
        color: Color(0xFF7819AD),
      ),
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          gradient: AppTheme.backgroundcolorgradient,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                scanQR();
              },
              child:
                  QrButton(text: "Scan QR Code", icon: FontAwesomeIcons.qrcode),
            ),
            // Text('Scan result : $_scanBarcode\n',
            //     style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}

//
// ElevatedButton(
// style: ButtonStyle(),
// onPressed: () => scanQR(),
// child: Text('Start QR scan')),
// Text('Scan result : $_scanBarcode\n',
// style: TextStyle(fontSize: 20))
// ]));
