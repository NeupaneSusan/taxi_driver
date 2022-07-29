import 'package:flutter/material.dart';
import 'package:texidriver/style/color.dart';

class OfflineDialogBox extends StatelessWidget {
  final Function() okBtnFunction;
  const OfflineDialogBox({Key? key, required this.okBtnFunction}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 80) / 2;

    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: SizedBox(
        height: 145,
        child: Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              "Go office?",
              style: TextStyle(
                  fontSize: 20.0,
                  color: textColor,
                  fontWeight: FontWeight.w500),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Do You Really Want to Offline.You Will Not Get any New Trip.When you are offline",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: textLightColor),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: okBtnFunction,
                  child: Container(
                    height: 36,
                    width: width,
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        )),
                    child: const Center(
                      child: Text(
                        "Go Offline",
                        style: TextStyle(fontSize: 15, color: backgroundColors),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 36,
                    width: width,
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                        )),
                    child: const Center(
                        child: Text("No",
                            style: TextStyle(
                                fontSize: 15, color: backgroundColors))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
