import 'package:flutter/material.dart';



class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 24, 248, 110),
            Color.fromARGB(255, 63, 248, 177)
          ]
        )
      ),

      child: Container(
        child: Column(
          children: [

            SizedBox(
              height: 100 ,
              width: double.infinity,
              child: Image(image: AssetImage("lib/assets/app_logo.png"))
            ),

            Container(height: 30),

            Text(
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
              "Welcome to E-Recycle \n Join us to save the environment"
            ),

            Container(margin: EdgeInsets.only(bottom: 350),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextButton(
                    onPressed: (){}, 
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),

                    
                  ),
                ),

                Text("    "),

                Container(
                  height: 50,
                  width: 120,

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)
                  ),

                  child: TextButton(
                    onPressed: (){}, 
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    ),

                    

                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}