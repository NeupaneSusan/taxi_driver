import 'dart:io';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texidriver/page/component/nointernetdialog_page.dart';
import 'package:texidriver/page/login_page.dart';
import 'package:texidriver/provider/map_provider.dart';
import 'package:texidriver/style/color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    final mapProvider = Provider.of<MapControllerProvider>(context,listen: false);
    mapProvider.loadImage();
    Future.delayed(const Duration(seconds: 2), () {
      checkInternet();
    });
  }

  void checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      print(result);
      if (result.isNotEmpty) {
        if (!mounted) return;
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return const LoginPage();
        }));
      } else {}
    } catch (error) {
      showDialog(
          context: context,
          builder: (context) => NoInternetDialogBox(function: () {
                Navigator.pop(context);
                Future.delayed(const Duration(seconds: 2), () {
                  checkInternet();
                });
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/taxi.png',
              width: 300,
              height: 400,
            ),
          ),
          const CircularProgressIndicator(
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
