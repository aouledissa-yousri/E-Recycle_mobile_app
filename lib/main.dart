import 'package:e_recycle_mobile_app/display/pages/nonAuthPages/LandingPage.dart';
import 'package:e_recycle_mobile_app/display/pages/nonAuthPages/PasswordResetPage.dart';
import 'package:e_recycle_mobile_app/display/pages/requiresAuthPages/DashBoardPage.dart';
import 'package:e_recycle_mobile_app/display/pages/semiAuthPages/ConfirmationCodePage.dart';
import 'package:e_recycle_mobile_app/display/pages/semiAuthPages/EnterNewPasswordPage.dart';
import "package:flutter/material.dart";

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DashBoardPage()
      )
    );
  }




}


