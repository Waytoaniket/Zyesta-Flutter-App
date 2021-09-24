import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:zyesta_app/screens/HomePage/widget/announcementcard.dart';

Widget carousel(Size size) {
  return Padding(
    padding: EdgeInsets.only(top: 10.0,bottom: 15.0),
    child: CarouselSlider(
      options: CarouselOptions(
          height: size.height / 5,
          autoPlay: true,
          viewportFraction: 1,
          autoPlayInterval: Duration(seconds: 10)),
      items: [1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return AnnouncementCard(width: size.width);
          },
        );
      }).toList(),
    ),
  );
}
