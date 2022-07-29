import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import 'package:location/location.dart';
import 'package:texidriver/style/color.dart';

class MapControllerProvider with ChangeNotifier {
  bool _isCompleted = false;
  LocationData? _movingLocations;
  BitmapDescriptor? _pickbitmapImage;
  BitmapDescriptor? _destinationbitmapImage;
  BitmapDescriptor? _carbitmapImage;
  final Set<Marker> _markers = {};
  Set<Polyline> _polyline = {};

  void loadImage() async {
    _pickbitmapImage = await _createMarkerImageFromAsset('assets/1.png');
    _destinationbitmapImage =
        await _createMarkerImageFromAsset('assets/dis_pin.png');
    _carbitmapImage = await _createMarkerImageFromAsset('assets/car_pin.png');
    notifyListeners();
  }

  void initial(LocationData position) async {
    _markers.clear();
    _polyline.clear();
    _movingLocations = position;
    _markers.add(Marker(
        markerId: const MarkerId('car'),
        rotation: position.heading!,
        position: LatLng(position.latitude!, position.longitude!),
        anchor: const Offset(0.5, 0.5),
        icon: carbitmapImage));
    _isCompleted = true;
    notifyListeners();
  }

  void setMovingMarker(LocationData data) {
    _markers.removeWhere((m) => m.markerId.value == "car");
    _markers.add(
      Marker(
          markerId: const MarkerId('car'),
          rotation: data.heading!,
          position: LatLng(data.latitude!, data.longitude!),
          anchor: const Offset(0.5, 0.5),
          icon: carbitmapImage),
    );
    _movingLocations = data;
    notifyListeners();
  }

  Set<Marker> get markers => _markers;
  BitmapDescriptor get carbitmapImage => _carbitmapImage!;
  BitmapDescriptor get pickupbitmapImage => _pickbitmapImage!;
  BitmapDescriptor get destinationbitmapImage => _destinationbitmapImage!;
  Set<Polyline> get polyline => _polyline;
  LocationData get movingLocation => _movingLocations!;
  bool get isCompleted => _isCompleted;
  Future<BitmapDescriptor> _createMarkerImageFromAsset(String iconPath) async {
    ByteData data = await rootBundle.load(iconPath);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: 50);
    ui.FrameInfo fi = await codec.getNextFrame();
    Uint8List markerIcon =
        (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
            .buffer
            .asUint8List();
    return BitmapDescriptor.fromBytes(markerIcon);
  }

  void getPolyline() async {
    try {
      _polyline.clear();
      List<LatLng> polylineCoordinates = [];
      PolylinePoints polylinePoints = PolylinePoints();
      Set<Polyline> polylines = {};
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyBnk8F0q6MoiqWNPFk5ay4ATjB4LAIy-Ys",
        const PointLatLng(
          27.616984, 83.488179
        ),
        const PointLatLng(27.713090, 83.463794),
        travelMode: TravelMode.driving,
      );
      print(result.points.length);
      if (result.status == 'OK') {
        for (int i = 0; i < result.points.length; i++) {
          polylineCoordinates.add(
              LatLng(result.points[i].latitude, result.points[i].longitude));
        }
      }
      polylines.add(Polyline(
          width: 6,
          color: primaryColor,
          polylineId: const PolylineId('polyLine'),
          points: polylineCoordinates));

      _polyline = polylines;
      notifyListeners();
    } catch (eror) {
      print(eror);
    }
  }
}
