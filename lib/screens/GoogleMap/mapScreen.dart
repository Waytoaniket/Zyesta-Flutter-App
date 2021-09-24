import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  double _originLatitude = 26.48435, _originLongitude = 50.04552;
  Map<MarkerId, Marker> markers = {};

  @override
  void initState() {
    _getLatLngByQuery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero,() => _getLatLngByQuery());
    return Scaffold(
        body: FutureBuilder(
      future: _getLatLngByQuery(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(_originLatitude, _originLongitude), zoom: 15),
            myLocationEnabled: true,
            tiltGesturesEnabled: true,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(markers.values),
          );
        } else {
          return Image.asset('assets/images/homepage/imageLoader.gif');
        }
      },
    ));
  }

  void _onMapCreated(GoogleMapController controller) async {
    setState(() {
      mapController = controller;
    });
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  Future _getLatLngByQuery() async {
    List<Location> locations =
        await locationFromAddress("Palava city, casa rio gold, dombivli");

    _addMarker(LatLng(locations.first.latitude, locations.first.longitude),
        'origin', BitmapDescriptor.defaultMarker);
    _originLatitude = locations.first.latitude;
    _originLongitude = locations.first.longitude;
    return true;
  }
}
