import 'dart:async';

import 'package:flutter/material.dart';
import "dart:math";






class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with SingleTickerProviderStateMixin{
  
  /*late AnimationController animationController;
  late Animation<double> animation;*/
  double angle = 0.0;
  Timer? timer;

  @override 
  void initState(){
    super.initState();
    /*animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInCirc);
    animationController.repeat();*/
    timer = Timer.periodic(Duration(milliseconds: 1), (Timer timer) => setAngle(angle+0.003));
  }

  @override 
  void dispose(){
    //animationController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

        height: 200,
        width: 200,
        child: Transform.rotate(
          angle: angle,
          child: CircularProgressIndicator(
            value: 0.5,
            color: Color.fromARGB(255, 19, 202, 141),
            strokeWidth: 15
          )
        )

      )
    );

      
  
  }


  
  setAngle(double angle) => setState(() {this.angle = angle;});
  



  


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