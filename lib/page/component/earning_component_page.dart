import 'package:flutter/material.dart';
import 'package:texidriver/style/color.dart';

class EarningComponentPage extends StatefulWidget {
  const EarningComponentPage({Key? key}) : super(key: key);

  @override
  State<EarningComponentPage> createState() => _EarningComponentPageState();
}

class _EarningComponentPageState extends State<EarningComponentPage> {
  final textStyle = const TextStyle(fontSize: 22, fontWeight: FontWeight.w500);
  final textStyled = const TextStyle(fontSize: 16, color: textColor);
  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 20) / 3.1;
    
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "26",
                            style: textStyle,
                          ),
                          Text("Total Trip", style: textStyled)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "25",
                            style: textStyle,
                          ),
                          Text(
                            "Online Hrs",
                            style: textStyled,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "123",
                            textAlign: TextAlign.center,
                            style: textStyle,
                          ),
                          Text(
                            "Total Earning",
                            style: textStyled,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(child: ListView.builder(
                shrinkWrap:true,
                padding: EdgeInsets.only(left: 5.0, right: 5.0,),
                itemCount: 26,
                itemBuilder: (context, index) {
                return DecoratedBox(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: textLightColor))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("#$index",style: TextStyle(fontSize: 18,color: textLightColor),),
                          Text("255$index",style: TextStyle(fontSize: 18,color:textLightColor))
                        ],
                      ),
                    ));
              }))
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",style: TextStyle(fontSize: 22,color: textColor,fontWeight: FontWeight.w500),),
                Text("Rs.255",style: TextStyle(fontSize: 22,color: textColor,fontWeight: FontWeight.w500))
              ],
            ),
          )
        ],
      ),
    );
  }
}
