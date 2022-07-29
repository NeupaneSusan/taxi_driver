import 'package:flutter/material.dart';
import 'package:texidriver/page/component/route_page.dart';
import 'package:texidriver/page/earning_page.dart';
import 'package:texidriver/page/profile_page.dart';
import 'package:texidriver/style/color.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 1.5;
    return SizedBox(
      width: width,
      child: Drawer(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 215,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                          color: textLightColor,
                          boxShadow: kElevationToShadow[4],
                          borderRadius: BorderRadius.circular(100.0)),
                      child: Image.asset(
                        "assets/taxi.png",
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      'Susan Neupane',
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: textLightColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      '980000000',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 20,
                        color: textLightColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Trips',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 22,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, materialRoute(context, const EarningPage()));
                    },
                    child: const Text(
                      'Earning',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 22,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Notification',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 22,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, materialRoute(context, const ProfilePage()));
                    },
                    child: const Text(
                      'Profile',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 22,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Change Password',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 22,
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  
                  const Text(
                    'Log Out',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 22,
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: PhysicalModel(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      'v1.0.1',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 20,
                        color: Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
