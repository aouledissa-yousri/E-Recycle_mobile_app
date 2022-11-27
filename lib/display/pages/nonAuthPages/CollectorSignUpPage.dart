import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../models/Citizen.dart';
import '../../../models/GenericUser.dart';
import '../../../services/UserManagementService.dart';


class CollectorSignUpPage extends StatefulWidget {
  const CollectorSignUpPage({super.key});


  @override
  State<CollectorSignUpPage> createState() => _CollectorSignUpPageState();
}

class _CollectorSignUpPageState extends State<CollectorSignUpPage> {


  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool loginButton = false;



  @override
  void dispose(){
    super.dispose();
    this.nameController.dispose();
    this.lastnameController.dispose();
    this.usernameController.dispose();
    this.emailController.dispose();
    this.passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
    
            Container(
              padding: EdgeInsets.all(0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, size: 30),
                onPressed: () => back(context)
              ),
              margin: EdgeInsets.only(bottom: 50),
              alignment: Alignment.topLeft,
            ),
            
            TextField(
              decoration: InputDecoration(
                hintText: "Enter name",
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
              ),
              controller: nameController,
              onChanged: (text){this.activateSignUp();},
            ),
    
    
    
            TextField(
              decoration: InputDecoration(
                hintText: "Enter lastname",
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
              ),
              controller: lastnameController,
              onChanged: (text){this.activateSignUp();},
            ),
    
    
            TextField(
              decoration: InputDecoration(
                hintText: "Enter email",
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
              ),
              controller: emailController,
              onChanged: (text){this.activateSignUp();},
            ),
    
    
            TextField(
              decoration: InputDecoration(
                hintText: "Enter username",
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
              ),
              controller: usernameController,
              onChanged: (text){this.activateSignUp();},
            ),
    
    
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter password",
              ),
              controller: passwordController, 
              onChanged: (text){this.activateSignUp();},
            ),
    
            Text("   "),
    
            SizedBox(
              width: double.infinity,
              height: 30,
              child:  ElevatedButton(
                
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 8, 221, 193)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
                  )
                ),
    
    
                child: Text("Sign Up"),
                onPressed: this.loginButton ? () => this.signUp(): null
              )
            ),
    
            Text("   "),
    
    
            SizedBox(
              width: double.infinity,
              height: 30,
              child:  ElevatedButton(
                
                style: ButtonStyle(
                  foregroundColor:  MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)), 
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 199, 0, 0)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
                  )
                ),
    
                child: Text("Reset"),
                onPressed: this.reset
              )
            ),
    
    
            Text("   "),
    
            
    
    
          ],
        )
      ),
    );
  }


  void activateSignUp(){
    setState(){
      if(this.usernameController.text != "" && this.passwordController.text != "") this.loginButton = true;
      else this.loginButton = false;
    }
  }

  void signUp(){
    UserManagementService.collectorSignUp(Citizen(
      GenericUser(this.usernameController.text, this.emailController.text, this.passwordController.text),
      this.nameController.text,
      this.lastnameController.text,
      0
    )).then((response) {
      dynamic responseData = jsonDecode(response.body);


      showDialog(context: context, builder: (context){
          
        return AlertDialog(
          title: Text(responseData["message"]),
          content: Text(responseData["message"]),
          actions: [
            ElevatedButton(
              onPressed: Navigator.of(context).pop, 
              child: Text("OK"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 8, 221, 193))
              )
            )
          ],
        );
      });


    });
  }
  

  void reset(){
    setState(() {
      this.nameController.text = "";
      this.lastnameController.text = "";
      this.emailController.text = "";
      this.usernameController.text = "";
      this.passwordController.text = "";
    });
  }


  void back(BuildContext context){
    Navigator.pop(context);
  }

}