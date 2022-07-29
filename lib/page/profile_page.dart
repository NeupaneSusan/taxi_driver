import 'package:flutter/material.dart';
import 'package:texidriver/style/color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
    
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           AppBar(
             elevation: 0.0,
             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
             centerTitle: true,
             title:const Text(
                    'My Profile',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w500,color: textColor),
                  ),
            leading:Padding(
              padding: const EdgeInsets.all(8.5),
              child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: PhysicalModel(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
            ), 
           ),
            
           
           
            Center(
              child: Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                  Container(
                    height: 550,
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 15.0,
                    left: 15.0,
                    child: Container(
                      height: 475,
                      width: width,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: shadowColor,
                                blurRadius: 10.0,
                                spreadRadius: 5.0)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 115.0,
                          ),
                          const Text(
                            'Peter Parker',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.location_on,
                                color: textLightColor,
                                size: 20,
                              ),
                              Text(
                                'Butwal,Rupandehi',
                                style: TextStyle(
                                    fontSize: 16, color: textLightColor),
                              )
                            ],
                          ),
                          const Divider(
                            height: 50,
                            color: textLightColor,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Email',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Flexible(
                                    child: Text(
                                  'peterparker@gmail.com',
                                  style: TextStyle(
                                      fontSize: 18.0, color: textLightColor),
                                ))
                              ],
                            ),
                          ),
                          const Divider(
                            height: 50,
                            color: textLightColor,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Phone',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Flexible(
                                    child: Text(
                                  '+9779867345023',
                                  style: TextStyle(
                                      fontSize: 18.0, color: textLightColor),
                                ))
                              ],
                            ),
                          ),
                          const Divider(
                            height: 50,
                            color: textLightColor,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Gender',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Flexible(
                                    child: Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 18.0, color: textLightColor),
                                ))
                              ],
                            ),
                          ),
                          const Divider(
                            height: 50,
                            color: textLightColor,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Gender',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Flexible(
                                    child: Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 18.0, color: textLightColor),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 190,
                            width: 190,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: shadowColor,
                                    blurRadius: 4.0,
                                    spreadRadius: -5.0,
                                    offset: Offset(0.0, -5.0),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100.0)),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/4.png'),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 25.0,
                              right: 10.0,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0xffE5E5E5),
                                          blurRadius: 2.0,
                                          spreadRadius: -1.0)
                                    ],
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Icon(
                                  Icons.camera_enhance_outlined,
                                  color: Color(0xff3D4246),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
              child: Material(
                elevation: 3.0,
                color: textColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 45.0,
                    child: Center(
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}