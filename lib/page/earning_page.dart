import 'package:flutter/material.dart';
import 'package:texidriver/page/component/earning_component_page.dart';

import 'package:texidriver/style/color.dart';

class EarningPage extends StatefulWidget {
  const EarningPage({Key? key}) : super(key: key);

  @override
  State<EarningPage> createState() => _EarningPageState();
}

class _EarningPageState extends State<EarningPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: const Text(
            ' Earning',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w500, color: textColor),
          ),
          leading: Padding(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: textLightColor))),
              child: TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                padding: EdgeInsets.zero,
              
                indicator: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ))),
                labelColor: textColor,
                labelStyle: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w500),
                unselectedLabelColor: textLightColor,
                
                tabs: const [
                  Tab(
                    text: 'Today',
                  ),
                  Tab(
                    text: 'Weekly',
                  ),
                  Tab(
                    text: 'Monthly',
                  ),
                  Tab(
                    text: 'Yearly',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  EarningComponentPage(),
                  Center(
                    child: Text(
                      'Place Bid',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Canceled',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Canceled',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
