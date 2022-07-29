import 'package:flutter/material.dart';
import 'package:texidriver/style/color.dart';

class NoInternetDialogBox extends StatelessWidget {
  final Function() function;
  const NoInternetDialogBox({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: SizedBox(
        height: 150,
        child: Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              "Oops!",
              style: TextStyle(
                  fontSize: 20.0,
                  color: textColor,
                  fontWeight: FontWeight.w500),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "There is no internate connection\nPlease check your internet connection.",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: textLightColor),
                ),
              ),
            ),
            GestureDetector(
              onTap: function,
              child: Container(
                height: 36,
                width: 140,
                
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text("Try Again",
                        style:
                            TextStyle(fontSize: 15, color: backgroundColors))),
              ),
            ),
           const SizedBox(height: 5.0,)
            
          ],
        ),
      ),
    );
  }
}
