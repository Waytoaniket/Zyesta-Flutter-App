import 'package:zyesta_app/screens/HomePage/widget/homecard.dart';

class EventDataModel {
  List<HomeCard>? eventList;

  EventDataModel({this.eventList});

  EventDataModel.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      eventList = <HomeCard>[];
      json['events'].forEach((v) {
       
        eventList!.add(
          new HomeCard(
            eventData: EventData.fromJson(v),
          ),
          
        );
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eventList != null) {
      data['events'] =
          this.eventList!.map((v) => v.eventData!.toJson()).toList();
    }
    return data;
  }
}

class EventData {
  String? eventId;
  String? userId;
  String? type;
  String? name;
  String? imageUrl;
  String? date;
  int? time;
  String? location;
  String? about;
  String? contact;
  String? preps;
  String? createdAt;
  String? updatedAt;
  String? hostId;

  EventData({
    this.eventId,
    this.userId,
    this.type,
    this.name,
    this.imageUrl,
    this.date,
    this.time,
    this.location,
    this.about,
    this.contact,
    this.preps,
    this.createdAt,
    this.updatedAt,
    this.hostId,
  });

  EventData.fromJson(Map<String, dynamic> json) {
    eventId = json['eventId'];
    userId = json['userId'];
    type = json['type'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    date = json['date'];
    time = json['time'];
    location = json['location'];
    about = json['about'];
    contact = json['contact'];
    preps = json['preps'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    hostId = json['hostId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventId'] = this.eventId;
    data['userId'] = this.userId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['date'] = this.date;
    data['time'] = this.userId;
    data['location'] = this.location;
    data['about'] = this.about;
    data['contact'] = this.contact;
    data['preps'] = this.preps;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['hostId'] = this.hostId;
    return data;
  }
}
