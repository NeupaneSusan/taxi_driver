import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texidriver/provider/time_provider.dart';
import 'package:texidriver/style/color.dart';


class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  OtpPageState createState() => OtpPageState();
}

class OtpPageState extends State<OtpPage> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  Timer? _timer;
  String? _otp;

  @override
  void initState() {
    getTimer();
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  getTimer() {
    final timeCounter =
        Provider.of<TimeCounterController>(context, listen: false);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick > 90) {
        timer.cancel();
      } else {
        timeCounter.updateRemainingTime();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Phone Verification',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Enter 5 digit OTP code we have sent to +9770000000000',
                style: TextStyle(fontSize: 15.0, color: textLightColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OtpInput(_fieldOne, false, 1),
                  OtpInput(_fieldTwo, false, 2),
                  OtpInput(_fieldThree, false, 3),
                  OtpInput(_fieldFour, false, 4),
                  OtpInput(_fieldFive, false, 5)
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  const Text(
                    "Didn't receice code? ",
                    style: TextStyle(color: textLightColor, fontSize: 14),
                  ),
                  Consumer<TimeCounterController>(
                      builder: (context, timeController, child) {
                    if (timeController.remainingTime == 0) {
                      return GestureDetector(
                        onTap: () {
                          timeController.setRemainingTime =90;
                          getTimer();
                        },
                        child: const Text('Send code again',  style: TextStyle(color: primaryColor)));
                    } else {
                      return Text(
                            textWidget(timeController.remainingTime),
                            style: const TextStyle(color: primaryColor),
                          );
                    }
                  }),
                ],
              ),
              // Text.rich(
              //   TextSpan(
              //     style: const TextStyle(fontSize: 14.0),
              //     children: [
              //       const TextSpan(
              //         text: "Didn't receice code? ",
              //         style: TextStyle(color: textLightColor),
              //       ),
              //       TextSpan(
              //           text: 'Send code again',
              //           style: const TextStyle(color: primaryColor),
              //           recognizer: TapGestureRecognizer()
              //             ..onTap = () {
              //               print('pRInt');
              //             }),
              //     ],
              //   ),
              // ),

              const SizedBox(
                height: 30.0,
              ),
              Material(
                elevation: 3.0,
                color: textColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const SizedBox(
                    height: 45.0,
                    child: Center(
                      child: Text(
                        "Verify",
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
          ),
        ),
      ),
    );
  }

  String textWidget(remainingTime) {
    var time = Duration(seconds: remainingTime--).toString().substring(2, 7);
    return time;
  }
}



class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final int index;
  const OtpInput(this.controller, this.autoFocus, this.index, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, top: 30.0),
        child: SizedBox(
          height: 60,
          width: 55,
          child: TextField(
            autofocus: autoFocus,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: controller,
            maxLength: 1,
            cursorColor: Theme.of(context).primaryColor,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                counterText: '',
                hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
            onChanged: (value) {
              if (value.length == 1) {
                if (index != 5) {
                  FocusScope.of(context).nextFocus();
                }
              }
              if (value.length == 0) {
                FocusScope.of(context).previousFocus();
              }
            },
          ),
        ),
      ),
    );
  }
}
