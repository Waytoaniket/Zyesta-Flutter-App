import 'package:flutter/material.dart';
import 'package:zyesta_app/screens/Animation/ImageInCardAnimation.dart';

class AnnouncementCard extends StatelessWidget {
  final String? imageSrc;
  final double? width;
  final double? height;

  const AnnouncementCard({Key? key, this.imageSrc, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 20),
width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            ImageInCardAnimation(
              image: "assets/images/homepage/offer.png",
              borderRadius: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
