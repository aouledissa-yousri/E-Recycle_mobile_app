import 'dart:async';

import 'package:flutter/material.dart';
import "dart:math";






class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage("lib/assets/app_logo.png"),
        height: 200,
        width: 200
      )
    );
  }
}


/*
left: BorderSide(
              color: Color.fromARGB(255, 19, 202, 141),
              width: 15 
            )*/


/*

  const Image(
            image: AssetImage("lib/assets/app_logo.png"),
            height: 200,
            width: 200
          )*/
  

/* 
decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20)
            )
          ),


          child: Material(
          // ignore: prefer_const_constructors
            shape: Border(
              left: BorderSide(
                color: Color.fromARGB(255, 19, 202, 141),
                width: 15 
              ),

              top: BorderSide(
                color: Color.fromARGB(255, 19, 202, 141),
                width: 15 
              )
            ),
          )
      );*/