import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:texidriver/page/home_page.dart';
import 'package:texidriver/page/signup_page.dart';

import 'package:texidriver/style/color.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              height: 550,
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: 5.0,
                )
              ], color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: textColor),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      const Text(
                        'Hi there!!! Wellcome Back',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: greyLight
                           ),
                      ),
                      Form(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Phone Number',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: textColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Flexible(
                                  child: Container(
                                height: 48.0,
                                width: 80,
                                child: const Center(child: Text("+977")),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.zero,
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.zero,
                                  ),
                                  border: Border(
                                      left: BorderSide(width: 1.0, color: lineColor),
                                      top: BorderSide(width: 1.0, color: lineColor),
                                      bottom:
                                          BorderSide(width: 1.0, color: lineColor),
                                      right: BorderSide(width: 1, color: lineColor)),
                                ),
                              )),
                              const Flexible(
                                flex: 4,
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                    hintText: "Enter your phone",
                                    hintStyle:
                                        TextStyle(fontSize: 16, color: lineColor),
                                    focusColor: primaryColor,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: lineColor),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        ),
                                        borderSide: BorderSide(color: primaryColor)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        ),
                                        borderSide: BorderSide(color:redColor)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10.0),
                              hintText: "Enter your password",
                              hintStyle: TextStyle(fontSize: 16, color: lineColor),
                              focusColor: primaryColor,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: lineColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: primaryColor)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: redColor)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Material(
                            elevation: 3.0,
                            color: textColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push( context,
                                MaterialPageRoute(builder: (_){
                                  return HomePage();
                                }));
                              },
                              child: const SizedBox(
                                height: 45.0,
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              height: 0.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: textLightColor,
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Or',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: textLightColor,
                                )),
                          ),
                          Flexible(
                            child: Container(
                              height: 0.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: textLightColor,
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 45.0,
                        margin: const EdgeInsets.only(top:10.0,bottom: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          border: Border.all(
                            color: textColor,
                          ),
                        ),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left:8.0),
                              child: Icon(Icons.facebook_sharp,
                              size: 25.0,
                              color: Color(0xff1778F2,
                              
                              ),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:20.0),
                              child: Text('Continue with Facebook',
                               style: TextStyle(
                                  fontSize: 17.0,
                                  color: textColor,
                                  fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: textColor,
                                fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (_)=> const SignUpPage()));
                            },
                            child: const Text(' Sign up',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: greyLight,
                                    fontWeight: FontWeight.w500)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  
  
  
  }
}
