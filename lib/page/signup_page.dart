import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:texidriver/page/opt_page.dart';
import 'package:texidriver/style/color.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Container(
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 5.0,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: textColor),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      const Text(
                        'Hi, Nice to meet you !!!',
                        style: TextStyle(
                            fontSize: 16.0,
                            
                            color: greyLight),
                      ),
                      Form(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Full Name',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: textColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10.0),
                              hintText: "Enter your full name",
                              hintStyle:
                                  TextStyle(fontSize: 16, color: lineColor),
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
                          const Text(
                            'Phone Number',
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, color: textColor),
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
                                      left: BorderSide(
                                          width: 1.0, color: lineColor),
                                      top: BorderSide(
                                          width: 1.0, color: lineColor),
                                      bottom: BorderSide(
                                          width: 1.0, color: lineColor),
                                      right: BorderSide(
                                          width: 1, color: lineColor)),
                                ),
                              )),
                              const Flexible(
                                flex: 4,
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                    hintText: "Enter your phone",
                                    hintStyle: TextStyle(
                                        fontSize: 16, color: lineColor),
                                    focusColor: primaryColor,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: lineColor),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        ),
                                        borderSide:
                                            BorderSide(color: primaryColor)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        ),
                                        borderSide:
                                            BorderSide(color: redColor)),
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
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, color: textColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10.0),
                              hintText: "Enter your password",
                              hintStyle:
                                  TextStyle(fontSize: 16, color: lineColor),
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
                                Navigator.push(context, MaterialPageRoute(builder: (_)=> const OtpPage()));
                              },
                              child: const SizedBox(
                                height: 45.0,
                                child: Center(
                                  child: Text(
                                    "Sign up",
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
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: textColor,
                                fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(' Log in',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: greyLight,
                                    fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                      const SizedBox(height: 25,),
                      
                       Text.rich(
                        TextSpan(
                          style: const TextStyle(fontSize: 14.0),
                          children: [
                           const TextSpan(
                              text: 'By singing up,you agree to our ',
                              style: TextStyle(color: textLightColor),
                            ),
                              
                            TextSpan(
                              text: 'Privacy Policy ',
                              style: const TextStyle(color: greyLight),
                              recognizer: TapGestureRecognizer()..onTap=(){
                                print('pRInt');
                              }
                            ),
                           const TextSpan(
                              text: 'and our ',
                              style: TextStyle(color: textLightColor),
                            ),
                            TextSpan(
                              text: 'Terms of Service',
                              style: const TextStyle(color: greyLight),
                              recognizer: TapGestureRecognizer()..onTap=(){
                                print('pRInt');
                              }
                              ),
                            
                          ],
                        ),
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
