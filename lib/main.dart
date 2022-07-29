import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texidriver/page/login_page.dart';
import 'package:texidriver/page/splash_page.dart';
import 'package:texidriver/provider/map_provider.dart';
import 'package:texidriver/provider/time_provider.dart';
import 'package:texidriver/provider/tripconfigure_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimeCounterController()),
        ChangeNotifierProvider(create: (context)=>MapControllerProvider()),
        ChangeNotifierProvider(create: (context) => TripConfigureProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
