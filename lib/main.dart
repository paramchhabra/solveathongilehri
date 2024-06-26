import 'package:flutter/material.dart';
import 'package:veddle/pages/cyclestation.dart';
import 'package:veddle/pages/gps.dart';
import 'package:veddle/pages/loginpage.dart';
import 'package:veddle/pages/qrcode.dart';
import 'package:veddle/pages/wallet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>LoginPage(),
        '/cycle':(context)=>CycleStationDetails(),
        '/qrcode':(context) => MyHome(),
        '/wallet':(context)=> WalletPage(),
        '/map':(context) => MapPage(),                            
      },
    );
  }
}
