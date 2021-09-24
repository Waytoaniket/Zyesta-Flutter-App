import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required this.finalImageUrl,
  }) : super(key: key);

  final String finalImageUrl;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5.h,
      left: 34.w,
      child: Container(
          height: 100.w / 3,
          width: 100.w / 3,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: FadeInImage(
              image: NetworkImage(finalImageUrl),
              placeholder: AssetImage(
                  "assets/images/registration/loading.gif"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                    'assets/images/registration/noprofileround.jpg',
                    fit: BoxFit.fitWidth);
              },
              fit: BoxFit.fitWidth,
            ),
          )),
    );
  }
}