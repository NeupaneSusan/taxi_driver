import 'dart:async';

// import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:texidriver/provider/map_provider.dart';

class FetchLocation {
  final BuildContext context;
  FetchLocation({
    required this.context,
  });
  BuildContext get contexts => context;
  StreamSubscription<LocationData>? positionStream;
  Location location = Location();
  void fetchLocation() {
    int count = 0;
    final mapProvider =
        Provider.of<MapControllerProvider>(context, listen: false);
    location.changeSettings();
    positionStream = location.onLocationChanged.listen((position) {
      count = count + 1;
      mapProvider.setMovingMarker(position);
    });
  }
  void cancel() {
    print('cancel');
    positionStream?.cancel();
  }
}
