import 'package:e_recycle_mobile_app/display/pages/nonAuthPages/CitizenLoginPage.dart';
import 'package:e_recycle_mobile_app/display/pages/nonAuthPages/CitizenSignUpPage.dart';
import 'package:e_recycle_mobile_app/display/pages/nonAuthPages/CollectorLoginPage.dart';
import 'package:e_recycle_mobile_app/display/pages/nonAuthPages/CollectorSignUpPage.dart';
import 'package:flutter/material.dart';



class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(50),
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
                "Welcome to \n E-Recycle \n Join us to save the environment"
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
                      onPressed: () => openLoginModal(context, "Login as collector", "Login as citizen"), 
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
                      onPressed: () => openSignUpModal(context, "Sign up as collector", "Sign up as citizen"), 
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
      ),
    );
  }







  void openSignUpModal(BuildContext context, String collectorText, String citizenText){

    showModalBottomSheet(

      context: context,
      isScrollControlled: true,
      builder: (context) {

        return Container(
          padding: EdgeInsets.all(20),
          child: Wrap(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => goToCitizenSignUpPage(context), 
                  child: Text(citizenText),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 8, 221, 193)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
                    )
                  )
                )
              ),
        
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => goToCollectorSignUpPage(context), 
                  child: Text(collectorText),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 8, 221, 193)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
                    )
                  )
                )
              ),
              
            ],
          ),
        );

      }
      
    );
  }


 void openLoginModal(BuildContext context, String collectorText, String citizenText){

    showModalBottomSheet(

      context: context,
      isScrollControlled: true,
      builder: (context) {

        return Container(
          padding: EdgeInsets.all(20),
          child: Wrap(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => goToCitizenLoginPage(context), 
                  child: Text(citizenText),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 8, 221, 193)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
                    )
                  )
                )
              ),
        
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => goToCitizenLoginPage(context), 
                  child: Text(collectorText),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 8, 221, 193)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
                    )
                  )
                )
              ),
              
            ],
          ),
        );

      }
      
    );
  }

  void hideModal(BuildContext context){
    Navigator.of(context).pop();
  }


  void goToCitizenSignUpPage(BuildContext context) {
    hideModal(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => CitizenSignUpPage()));
  }

  void goToCollectorSignUpPage(BuildContext context) {
    hideModal(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => CollectorSignUpPage()));
  }

  void goToCitizenLoginPage(BuildContext context){
    hideModal(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => CitizenLoginPage()));
  }

  void goToCollectorLoginPage(BuildContext context){
    hideModal(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => CollectorLoginPage()));
  }



}