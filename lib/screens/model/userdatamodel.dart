import 'dart:io';

class UserDataModel {
  String? accesstoken;
  String? userId;
  String? token;
  bool? verifiedEmail;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? password;
  String? profileImageUrl;
  int? age;
  String? gender;
  String? city;
  String? about;
  String? interests;
  String? job_role;
  String? company;
  String? university;
  String? qualification;

  UserDataModel(
      {this.accesstoken = "",
      this.userId = "",
      this.token = "",
      this.verifiedEmail = false,
      this.username: "",
      this.firstName: "",
      this.lastName: "",
      this.email: "",
      this.mobile: "",
      this.password: "",
      this.profileImageUrl: "",
      this.age: 0,
      this.gender: "",
      this.city: "",
      this.about: "",
      this.interests: "",
      this.job_role: "",
      this.company: "",
      this.university: "",
      this.qualification: "",
      });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    accesstoken = json['accesstoken'];
    userId = json['user']['userId'];
    token = json['user']['token'];
    verifiedEmail = json['user']['verifiedEmail'];
    username = json['user']['username'];
    firstName = json['user']['firstName'];
    lastName = json['user']['lastName'];
    email = json['user']['email'];
    mobile = json['user']['mobile'];
    password = json['user']['password'];
    profileImageUrl = json['user']['profileImageUrl'];
    age = json['user']['age'];
    gender = json['user']['gender'];
    city = json['user']['city'];
    about = json['user']['about'];
    interests = json['user']['interests'];
    job_role = json['user']['job_role'];
    company = json['user']['company'];
    university = json['user']['university'];
    qualification = json['user']['qualification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['username'] = this.username!;
    data['firstName'] = this.firstName!;
    data['lastName'] = this.lastName!;
    data['email'] = this.email!;
    data['mobile'] = this.mobile!;
    data['password'] = this.password!;
    data['profileImageUrl'] = this.profileImageUrl!;
    data['age'] = this.age!.toString();
    data['gender'] = this.gender!;
    data['city'] = this.city!;
    data['about'] = this.about!;
    data['interests'] = this.interests!;
    data['job_role'] = this.job_role!;
    data['company'] = this.company!;
    data['university'] = this.university!;
    data['qualification'] = this.qualification!;
    return data;
  }
}
