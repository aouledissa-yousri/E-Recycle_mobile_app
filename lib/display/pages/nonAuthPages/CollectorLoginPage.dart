import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../helpers/DirectoryHelper.dart';
import '../../../services/UserManagementService.dart';
import '../requiresAuthPages/DashBoardPage.dart';
import '../semiAuthPages/ConfirmationCodePage.dart';


class CollectorLoginPage extends StatefulWidget {
  const CollectorLoginPage({super.key});


  @override
  State<CollectorLoginPage> createState() => _CollectorLoginPageState();
}

class _CollectorLoginPageState extends State<CollectorLoginPage> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool loginButton = false;



  @override
  void dispose(){
    super.dispose();
    this.usernameController.dispose();
    this.passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
    
            Image(image: AssetImage("lib/assets/app_logo.png"), height: 100, width: 100),
    
            TextField(
              decoration: InputDecoration(
                hintText: "Enter username",
                icon: Icon(Icons.person, color: Color.fromARGB(255, 8, 221, 193)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
              ),
              controller: usernameController,
              onChanged: (text){this.activateLogin();},
            ),
    
    
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter password",
                icon: Icon(Icons.lock, color: Color.fromARGB(255, 8, 221, 193))
              ),
              controller: passwordController, 
              onChanged: (text){this.activateLogin();},
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
    
    
                child: Text("Login"),
                onPressed: this.loginButton ? null : () => this.login()
              )
            ),
    
            Text("   "),
    
    
            SizedBox(
              width: double.infinity,
              height: 30,
              child:  ElevatedButton.icon(
                
                style: ButtonStyle(
                  foregroundColor:  MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)), 
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 199, 0, 0)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
                  )
                ),
    
                label: Text("Login with Google"),
                icon: ImageIcon(
                  AssetImage("lib/assets/google.png"),
                  color: Color.fromARGB(255, 255, 255, 255),
                  
                ),
                onPressed: this.loginButton ? () => this.login(): null
              )
            ),
    
    
            Text("   "),
    
            SizedBox(
              width: double.infinity,
              height: 30,
              child:  ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 8, 57, 194)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
                  )
                ),
    
                icon: ImageIcon(
                  AssetImage("lib/assets/facebook.png"),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
    
                label: Text("Login with facebook"),
                onPressed: (){},
              )
            )
    
    
          ],
        )
      ),
    );
  }


  void activateLogin(){
   void activateLogin(){
    if(this.usernameController.text != "" && this.passwordController.text != "") 
      setState(() => this.loginButton = true);
    
    else setState(() => this.loginButton = false);
  }
  }

  void login() {
    UserManagementService.login(this.usernameController.text, this.passwordController.text).then((response) async {
      dynamic responseData = jsonDecode(response.body);
      if(responseData["message"] == "password is wrong" || responseData["message"] == "user not found" || responseData["message"] == "your account is temporarily blocked please try again later!")
        showDialog(context: context, builder: (context){
          
          return AlertDialog(
            title: Text("Error"),
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


      if(responseData["message"] == "A confirmation code has been sent to your email") Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmationCodePage()));
        
      else {
        DirectoryHelper.setUserData(responseData);
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardPage()));
      }


    });
  }
  

  void reset(){
    setState(() {
      this.usernameController.text = "";
      this.passwordController.text = "";
    });
  }




}