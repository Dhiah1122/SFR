
import 'package:flutter/material.dart';
import 'package:sfr_designed/Screen/LoginScreen.dart';
import 'package:sfr_designed/Screen/RegistreScreen.dart';
import 'package:sfr_designed/Screen/nav.dart';

import 'Screen/NouveauTicketScreen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "FSR",
      home: NouvTicketScreen() ,
    );
  }
}