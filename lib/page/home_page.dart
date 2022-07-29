import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:texidriver/page/component/drawer_page.dart';
import 'package:texidriver/page/component/offline_page.dart';
import 'package:texidriver/page/component/trip_dialog_page.dart';
import 'package:texidriver/provider/fetching_location.dart';
import 'package:texidriver/provider/map_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late FetchLocation fetchLocation;
  late GoogleMapController mapController;
  late bool serviceEnabled;
  String? mapStyle;
  double _latitude = 0.0;
  double _longitude = 0.0;
  bool isLoading = false;
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    fetchLocation = FetchLocation(context: context);
    rootBundle.loadString('assets/mapstyle/mapStyle.txt').then((string) {
      mapStyle = string;
    }).catchError((error) {});
    _determinePositionLocation();
    // disPlay();
  }

  disPlay() {
    Future.delayed(
        Duration(
          seconds: 10,
        ), () {
      showModelBottomSheet(context);
    });
  }

  CameraPosition initialCameraPosition() {
    return CameraPosition(
      target: LatLng(_latitude, _longitude),
      zoom: 15.0,
    );
  }

  void _determinePositionLocation() async {
    final mapProvider =
        Provider.of<MapControllerProvider>(context, listen: false);

    LocationData location = await Location.instance.getLocation();
    _latitude = location.latitude!;
    _longitude = location.longitude!;
    mapProvider.initial(location);
    fetchLocation.fetchLocation();
  }

  @override
  void dispose() {
    fetchLocation.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double iconSize = 45;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MyDrawer(),
      body: Stack(children: [
        SizedBox(
          height: height,
          width: width,
          child: Consumer<MapControllerProvider>(
              builder: (context, mapProvider, child) {
                print(mapProvider.polyline);
            return GoogleMap(
                onCameraMove: (position) {},
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                compassEnabled: false,
                markers: mapProvider.markers,
                polylines: mapProvider.polyline,
                onCameraIdle: () {},
                onMapCreated: (controller) {
                  mapController = controller;
                  mapController.setMapStyle(mapStyle);
                  if (mapProvider.isCompleted) {
                    mapController.animateCamera(
                        CameraUpdate.newCameraPosition(CameraPosition(
                      target: LatLng(mapProvider.movingLocation.latitude!,
                          mapProvider.movingLocation.longitude!),
                      zoom: 15,
                      tilt: 30.0,
                    )));
                  }
                },
                initialCameraPosition: initialCameraPosition());
          }),
        ),
        // Positioned(
        //   top: (height - (iconSize) * 2) / 2,
        //   right: (width - iconSize + 18) / 2,
        //   child: Image.asset(
        //     "assets/1.png",
        //     height: iconSize,
        //   ),
        // ),
        Positioned(
            top: 30.0,
            left: 15,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: PhysicalModel(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.menu_sharp,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.92,
                  child: PhysicalModel(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.white,
                    child: StatefulBuilder(builder: (context, innerState) {
                      return CupertinoSwitch(
                        dragStartBehavior: DragStartBehavior.start,
                        trackColor: Colors.blueGrey,
                        value: isActive,
                        onChanged: (value) {
                          if (isActive) {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return OfflineDialogBox(
                                  okBtnFunction: () {
                                    innerState(
                                      () {
                                        isActive = false;
                                      },
                                    );
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          } else {
                            innerState(() {
                              isActive = true;
                            });
                            const snackBar = SnackBar(
                              content:
                                  Text('Hy, As soon as we will get new job'),
                              backgroundColor: Colors.green,
                              elevation: 8.0,
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                      );
                    }),
                  ),
                ),
              ],
            )),
        Positioned(
          bottom: 200,
          child: ElevatedButton(
              onPressed: () {
                showModelBottomSheet(context);
              },
              child: Text("Click")),
        )
      ]),
    );
  }
}
