import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GeoFlutterFire geo = GeoFlutterFire();
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  StreamSubscription<Position>? positionStream;

  Future<void> handleLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location services are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location services are denied forever');
    }
  }

  void storeUserLocation(String userUid, GeoFirePoint geoFirePoint) {
    _firestore
        .collection('users')
        .doc(userUid)
        .update({'position': geoFirePoint.data});
  }

  Future<void> listenUserLocation(String userUid) async {
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      GeoFirePoint geoFirePoint = geo.point(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      storeUserLocation(userUid, geoFirePoint);
    });
  }

  void dispose() {
    positionStream?.cancel();
    positionStream = null;
  }
}
