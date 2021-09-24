import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zyesta_app/screens/OtherProfile/widgets/design.dart';

class Details extends StatelessWidget {
  const Details(
      {Key? key,
      required this.about,
      required this.interests,
      required this.jobTitle,
      required this.company,
      required this.university,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.gender,
      required this.city})
      : super(key: key);

  final String about;
  final String interests;
  final String jobTitle;
  final String company;
  final String university;
  final String firstName;
  final String lastName;
  final String age;
  final String gender;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          firstName + " " + lastName,
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
        ),
        SizedBox(
          height: 2.h,
        ),
        paraDetail(
          heading: "About",
          detail: about,
        ),
        SizedBox(
          height: 2.h,
        ),
        paraDetail(
          heading: "Interests",
          detail: interests,
        ),
        SizedBox(
          height: 2.h,
        ),
        job(
            jobTitle: jobTitle,
            company: company,
            university: university),
        SizedBox(
          height: 2.h,
        ),
        personalDetails(
            firstName: firstName,
            lastName: lastName,
            age: age,
            gender: gender,
            city: city),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}

class personalDetails extends StatelessWidget {
  const personalDetails({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.city,
  }) : super(key: key);

  final String firstName;
  final String lastName;
  final String age;
  final String gender;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: boxPadding,
      width: 80.w,
      decoration: boxProfileDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Personal Details", style: profileHeading),
          ShortDetail(
            heading: ' Firstname  ',
            icon: Icons.person,
            detail: firstName,
          ),
          ShortDetail(
            heading: ' Lastname  ',
            icon: Icons.person,
            detail: lastName,
          ),
          ShortDetail(
            heading: ' Age              ',
            icon: Icons.person,
            detail: age,
          ),
          ShortDetail(
            heading: ' Gender       ',
            icon: Icons.person,
            detail: gender,
          ),
          ShortDetail(
            heading: ' City              ',
            icon: Icons.business,
            detail: city,
          ),
        ],
      ),
    );
  }
}

class job extends StatelessWidget {
  const job({
    Key? key,
    required this.jobTitle,
    required this.company,
    required this.university,
  }) : super(key: key);

  final String jobTitle;
  final String company;
  final String university;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: boxPadding,
      width: 80.w,
      decoration: boxProfileDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Job and Education", style: profileHeading),
          ShortDetail(
            heading: ' Job Title    ',
            icon: Icons.location_city,
            detail: jobTitle,
          ),
          ShortDetail(
            heading: ' Company',
            icon: Icons.corporate_fare,
            detail: company,
          ),
          ShortDetail(
            heading: ' University ',
            icon: Icons.school,
            detail: university,
          ),
        ],
      ),
    );
  }
}

class ShortDetail extends StatelessWidget {
  const ShortDetail({
    Key? key,
    required this.detail,
    required this.heading,
    required this.icon,
  }) : super(key: key);

  final String detail;
  final String heading;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: (1).h,bottom: (1).h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Color(0xFF7819AD),
            size: 4.w,
          ),
          Text(heading, style: subHeading),
          SizedBox(
            width: 3.w,
          ),
          Expanded(
            child: Text(
              detail,
              style: contentHeading,
            ),
          ),
        ],
      ),
    );
  }
}

class paraDetail extends StatelessWidget {
  const paraDetail({
    Key? key,
    required this.detail,
    required this.heading,
  }) : super(key: key);

  final String heading;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      padding: boxPadding,
      decoration: boxProfileDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading, style: profileHeading),
          Padding(
            padding: EdgeInsets.only(top: 1.h,bottom: 1.h),
            child: Text(
              detail,
              style: contentHeading,
            ),
          ),
        ],
      ),
    );
  }
}
