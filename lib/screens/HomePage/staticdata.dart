
import 'package:zyesta_app/screens/HomePage/widget/homecard.dart';
import 'package:zyesta_app/screens/model/EventDataModel.dart';

class StaticData {
  static categoryList() {
    return <HomeCard>[
      HomeCard(
        eventData: new EventData(
          name: "Music Concert",
          date: "Tomorrow 08:00 pm",
          location: "Alan Walker",
          imageUrl: "assets/images/homepage/card.png",
        ),
      ),
      HomeCard(
        eventData: new EventData(
          name: "Hiking Hills",
          date: "Monday 07:00 am",
          location: "Explore the mountains",
          imageUrl: "assets/images/homepage/card.png",
        ),
        
      ),
      HomeCard(
        eventData: new EventData(
          name: "Mitron",
          date: "Sunday 05:00 pm",
          location: "Mumbai",
          imageUrl: "assets/images/homepage/card.png",
        ),
        
      ),
      HomeCard(
        eventData: new EventData(
          name: "Taj",
          date: "Today 04:00 pm",
          location: "Mumbai",
          imageUrl: "assets/images/homepage/card.png",
        ),
      ),
    ];
  }
}
