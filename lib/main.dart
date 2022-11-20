import 'package:e_recycle_mobile_app/display/pages/loadingSplashScreenPages/LoadingPage.dart';
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
        body: LoadingPage()
      )
    );
  }




}


