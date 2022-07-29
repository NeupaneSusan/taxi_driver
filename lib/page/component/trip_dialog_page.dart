
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texidriver/page/component/url_launch.dart';
import 'package:texidriver/provider/fetching_location.dart';
import 'package:texidriver/provider/map_provider.dart';
import 'package:texidriver/provider/tripconfigure_provider.dart';

import 'package:texidriver/style/color.dart';

void showModelBottomSheet(context) async {
  return showModalBottomSheet(
    context: context,
    barrierColor: Colors.transparent,
    backgroundColor: backgroundColors,
    isScrollControlled: false,
    elevation: 20,
    isDismissible: false,
    enableDrag: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10.0)),
    ),
    builder: (BuildContext context) {
      return const TripDetailPage();
    },
  );
}

class TripDetailPage extends StatefulWidget {
  const TripDetailPage({Key? key}) : super(key: key);

  @override
  State<TripDetailPage> createState() => _TripDetailPageState();
}

class _TripDetailPageState extends State<TripDetailPage> {
  @override
  Widget build(BuildContext context) {
    final widthFirst = MediaQuery.of(context).size.width / 2;
    final widthSecond = MediaQuery.of(context).size.width / 3;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Consumer<TripConfigureProvider>(
          builder: (context, tripConfigure, child) {
        return SizedBox(
          height: 250,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                  child: Column(
                    children: [
                      const Text(
                        'Trip Details',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: textColor),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                ),
                                Text("Susan Neupane jksdahkjahsdfds jksdafj",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        color: textColor))
                              ],
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 2,
                            color: lineColor,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Distance",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                ),
                                Text("2.5km",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        color: textColor))
                              ],
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 2,
                            color: lineColor,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Fare",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                ),
                                Text("Rs.50000",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        color: textColor))
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              const Icon(
                                Icons.my_location,
                                color: Color(0xFF69F0AE),
                              ),
                              for (int i = 0; i < 4; i++)
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Container(
                                      height: 5.0,
                                      width: 2.0,
                                      decoration: BoxDecoration(
                                          color: textLightColor,
                                          borderRadius:
                                              BorderRadius.circular(3))),
                                ),
                              const Icon(Icons.location_on,
                                  color: Color(0xffED643E)),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      "RUpandehi kdkd ",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          color: textColor),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color: lineColor,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      "ownMapController.getdestinationAddress",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          color: textColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          tripConfigure.tripStatus != 0
                              ? Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  child: const Icon(
                                    Icons.navigation_sharp,
                                    size: 35,
                                    color: secondaryColor,
                                  ),
                                )
                              : const Text('')
                        ],
                      )
                    ],
                  ),
                ),
              ),
              tripConfigure.tripStatus == 0 || tripConfigure.tripStatus == 1
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                         
                            Navigator.pop(context);
                            tripConfigure.clear();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: tripConfigure.tripStatus == 0
                                ? widthFirst
                                : widthSecond,
                            color: textColor,
                            child: const Text("Reject",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        tripConfigure.tripStatus == 1 ||
                                tripConfigure.tripStatus == 2
                            ? GestureDetector(
                                onTap: () {
                                  makePhoneCall("9867255019");
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  width: widthSecond,
                                  color: redColor,
                                  child: const Text("Cell",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                ),
                              )
                            : const SizedBox(),
                        GestureDetector(
                          onTap: () {
                            final mapControllerProvider =  Provider.of<MapControllerProvider>(context,listen: false);
                            if (tripConfigure.tripStatus == 0) {
                              tripConfigure.setStatus(1);
                              mapControllerProvider.getPolyline();
                              
                            } else if (tripConfigure.tripStatus == 1 &&
                                tripConfigure.isArrived) {
                              tripConfigure.setStatus(2);
                            }
                            // if (!isAccept) {
                            //   setState(() {
                            //     isAccept = true;
                            //   });
                            
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: tripConfigure.tripStatus == 0
                                ? widthFirst
                                : widthSecond,
                            color: Colors.green,
                            child: Text(
                                tripConfigure.tripStatus == 0
                                    ? "Accept"
                                    : "Arrived",
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                        )
                      ],
                    )
                  : tripConfigure.tripStatus == 2
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                makePhoneCall("9867255019");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 45,
                                width: widthFirst,
                                color: redColor,
                                child: const Text("Cell",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (tripConfigure.isArrived) {
                                  tripConfigure.setStatus(3);
                                }
                                
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 45,
                                width: widthFirst,
                                color: Colors.green,
                                child: const Text("Start Trip",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              ),
                            )
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            if (tripConfigure.isDestination) {
                              tripConfigure.setStatus(4);
                             
                              tripConfigure.clear();
                            } else{
                              print("U don't reach at destination");
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: widthFirst * 2,
                            height: 45,
                            color: redColor,
                            child: const Text("End Trip",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
            ],
          ),
        );
      }),
    );
  }
}
