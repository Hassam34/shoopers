import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart'
import './Login/authentication.dart';
// import 'dart:async';
import "Navigation/navigation.dart";
import './Login/SimpleLogin/signIn.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vlogger.pk",
      home: 
      SignIn()
      // Navigation(),
      // Authentication(),
    );
  }
}
